require 'spec_helper'

describe 'CF Droplet Buildpack' do
  let(:browser) { Machete::Browser.new(app) }

  after do
    Machete::CF::DeleteApp.new.execute(app)
  end

  describe 'deploying a compiled droplet' do
    let(:app_name) { 'droplet' }

    context 'when not specifying a buildpack' do
      let(:app) { Machete.deploy_app(app_name) }

      it 'deploys successfully' do
        expect(app).to be_running

        browser.visit_path('/')

        expect(browser.body).to include('CloudCredo for all your Cloud Foundry and BOSH consultancy needs!')
      end
    end
  end
end
