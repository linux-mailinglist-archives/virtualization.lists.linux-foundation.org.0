Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1178C143876
	for <lists.virtualization@lfdr.de>; Tue, 21 Jan 2020 09:40:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AE97286272;
	Tue, 21 Jan 2020 08:40:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v+yt-NoU7Y5s; Tue, 21 Jan 2020 08:40:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5B1A1863B7;
	Tue, 21 Jan 2020 08:40:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 30A82C0174;
	Tue, 21 Jan 2020 08:40:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A34FAC0174
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 08:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8997020386
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 08:40:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J1-EjXTPRdY0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 08:40:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by silver.osuosl.org (Postfix) with ESMTPS id DE74C2002C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 08:40:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jan 2020 00:40:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,345,1574150400"; d="scan'208";a="426980307"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by fmsmga006.fm.intel.com with ESMTP; 21 Jan 2020 00:40:10 -0800
Received: from fmsmsx120.amr.corp.intel.com (10.18.124.208) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 21 Jan 2020 00:40:09 -0800
Received: from shsmsx105.ccr.corp.intel.com (10.239.4.158) by
 fmsmsx120.amr.corp.intel.com (10.18.124.208) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 21 Jan 2020 00:40:09 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.197]) by
 SHSMSX105.ccr.corp.intel.com ([169.254.11.28]) with mapi id 14.03.0439.000;
 Tue, 21 Jan 2020 16:40:07 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Wang <jasowang@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Subject: RE: [PATCH 3/5] vDPA: introduce vDPA bus
Thread-Topic: [PATCH 3/5] vDPA: introduce vDPA bus
Thread-Index: AQHVzGqWKPTi/OFGjEKwu/LvhcJvQafs4oEAgADD3ACAByi08A==
Date: Tue, 21 Jan 2020 08:40:07 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D73EBA4@SHSMSX104.ccr.corp.intel.com>
References: <20200116124231.20253-1-jasowang@redhat.com>
 <20200116124231.20253-4-jasowang@redhat.com>
 <20200116152209.GH20978@mellanox.com>
 <03cfbcc2-fef0-c9d8-0b08-798b2a293b8c@redhat.com>
In-Reply-To: <03cfbcc2-fef0-c9d8-0b08-798b2a293b8c@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMzU2MDNiODYtZmY4MC00MDZjLTg2NGYtOWNkZWZjNWFlZmEwIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiaHNIbmwxWVBLb1A1M1prQ0hNdmtzSW51VUVLNitwcldLTnJJK2lSNUE4RG42d2VDQlpEbUhoNmhPa0F3K1ZvbCJ9
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: "jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "mst@redhat.com" <mst@redhat.com>,
 "mhabets@solarflare.com" <mhabets@solarflare.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "lulu@redhat.com" <lulu@redhat.com>, "hanand@xilinx.com" <hanand@xilinx.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 Shahaf Shuler <shahafs@mellanox.com>, Parav Pandit <parav@mellanox.com>,
 Jiri Pirko <jiri@mellanox.com>, "Wang, Xiao W" <xiao.w.wang@intel.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>, "Wang,
 Zhihong" <zhihong.wang@intel.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "Zhu,
 Lingshan" <lingshan.zhu@intel.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

PiBGcm9tOiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPg0KPiBTZW50OiBGcmlkYXks
IEphbnVhcnkgMTcsIDIwMjAgMTE6MDMgQU0NCj4gDQo+IA0KPiBPbiAyMDIwLzEvMTYg5LiL5Y2I
MTE6MjIsIEphc29uIEd1bnRob3JwZSB3cm90ZToNCj4gPiBPbiBUaHUsIEphbiAxNiwgMjAyMCBh
dCAwODo0MjoyOVBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOg0KPiA+PiB2RFBBIGRldmljZSBp
cyBhIGRldmljZSB0aGF0IHVzZXMgYSBkYXRhcGF0aCB3aGljaCBjb21wbGllcyB3aXRoIHRoZQ0K
PiA+PiB2aXJ0aW8gc3BlY2lmaWNhdGlvbnMgd2l0aCB2ZW5kb3Igc3BlY2lmaWMgY29udHJvbCBw
YXRoLiB2RFBBIGRldmljZXMNCj4gPj4gY2FuIGJlIGJvdGggcGh5c2ljYWxseSBsb2NhdGVkIG9u
IHRoZSBoYXJkd2FyZSBvciBlbXVsYXRlZCBieQ0KPiA+PiBzb2Z0d2FyZS4gdkRQQSBoYXJkd2Fy
ZSBkZXZpY2VzIGFyZSB1c3VhbGx5IGltcGxlbWVudGVkIHRocm91Z2ggUENJRQ0KPiA+PiB3aXRo
IHRoZSBmb2xsb3dpbmcgdHlwZXM6DQo+ID4+DQo+ID4+IC0gUEYgKFBoeXNpY2FsIEZ1bmN0aW9u
KSAtIEEgc2luZ2xlIFBoeXNpY2FsIEZ1bmN0aW9uDQo+ID4+IC0gVkYgKFZpcnR1YWwgRnVuY3Rp
b24pIC0gRGV2aWNlIHRoYXQgc3VwcG9ydHMgc2luZ2xlIHJvb3QgSS9PDQo+ID4+ICAgIHZpcnR1
YWxpemF0aW9uIChTUi1JT1YpLiBJdHMgVmlydHVhbCBGdW5jdGlvbiAoVkYpIHJlcHJlc2VudHMg
YQ0KPiA+PiAgICB2aXJ0dWFsaXplZCBpbnN0YW5jZSBvZiB0aGUgZGV2aWNlIHRoYXQgY2FuIGJl
IGFzc2lnbmVkIHRvIGRpZmZlcmVudA0KPiA+PiAgICBwYXJ0aXRpb25zDQo+ID4+IC0gVkRFViAo
VmlydHVhbCBEZXZpY2UpIC0gV2l0aCB0ZWNobm9sb2dpZXMgc3VjaCBhcyBJbnRlbCBTY2FsYWJs
ZQ0KPiA+PiAgICBJT1YsIGEgdmlydHVhbCBkZXZpY2UgY29tcG9zZWQgYnkgaG9zdCBPUyB1dGls
aXppbmcgb25lIG9yIG1vcmUNCj4gPj4gICAgQURJcy4NCg0KdGhlIGNvbmNlcHQgb2YgVkRFViBp
bmNsdWRlcyBib3RoIHNvZnR3YXJlIGJpdHMgYW5kIEFESXMuIElmIHlvdQ0Kb25seSB0YWtlIGFi
b3V0IGhhcmR3YXJlIHR5cGVzLCB1c2luZyBBREkgaXMgbW9yZSBhY2N1cmF0ZS4NCg0KPiA+PiAt
IFNGIChTdWIgZnVuY3Rpb24pIC0gVmVuZG9yIHNwZWNpZmljIGludGVyZmFjZSB0byBzbGljZSB0
aGUgUGh5c2ljYWwNCj4gPj4gICAgRnVuY3Rpb24gdG8gbXVsdGlwbGUgc3ViIGZ1bmN0aW9ucyB0
aGF0IGNhbiBiZSBhc3NpZ25lZCB0byBkaWZmZXJlbnQNCj4gPj4gICAgcGFydGl0aW9ucyBhcyB2
aXJ0dWFsIGRldmljZXMuDQo+ID4gSSByZWFsbHkgaG9wZSB3ZSBkb24ndCBlbmQgdXAgd2l0aCB0
d28gZGlmZmVyZW50IHdheXMgdG8gc3BlbGwgdGhpcw0KPiA+IHNhbWUgdGhpbmcuDQo+IA0KPiAN
Cj4gSSB0aGluayB5b3UgbWVhbnQgQURJIHZzIFNGLiBJdCBsb29rcyB0byBtZSB0aGF0IEFESSBp
cyBsaW1pdGVkIHRvIHRoZQ0KPiBzY29wZSBvZiBzY2FsYWJsZSBJT1YgYnV0IFNGIG5vdC4NCg0K
QURJIGlzIGp1c3QgYSB0ZXJtIGZvciBtaW5pbWFsbHkgYXNzaWduYWJsZSByZXNvdXJjZSBpbiBT
Y2FsYWJsZSBJT1YuIA0KJ2Fzc2lnbmFibGUnIGltcGxpZXMgc2V2ZXJhbCB0aGluZ3MsIGUuZy4g
dGhlIHJlc291cmNlIGNhbiBiZSBpbmRlcGVuZGVudGx5IA0KbWFwcGVkIHRvL2FjY2Vzc2VkIGJ5
IHVzZXIgc3BhY2Ugb3IgZ3Vlc3QsIERNQXMgYmV0d2VlbiB0d28NCkFESXMgYXJlIGlzb2xhdGVk
LCBvcGVyYXRpbmcgb25lIEFESSBkb2Vzbid0IGFmZmVjdGluZyBhbm90aGVyIEFESSwNCmV0Yy4g
IEknbSBub3QgY2xlYXIgYWJvdXQgIG90aGVyIHZlbmRvciBzcGVjaWZpYyBpbnRlcmZhY2VzLCBi
dXQgc3VwcG9zaW5nDQp0aGV5IG5lZWQgbWF0Y2ggdGhlIHNpbWlsYXIgcmVxdWlyZW1lbnRzLiBU
aGVuIGRvIHdlIHJlYWxseSB3YW50IHRvDQpkaWZmZXJlbnRpYXRlIEFESSB2cy4gU0Y/IFdoYXQg
YWJvdXQgbWVyZ2luZyB0aGVtIHdpdGggQURJIGFzIGp1c3QNCm9uZSBleGFtcGxlIG9mIGZpbmVy
LWdyYWluZWQgc2xpY2luZz8NCg0KPiANCj4gDQo+ID4NCj4gPj4gQEAgLTAsMCArMSwyIEBADQo+
ID4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+ID4+ICtvYmotJChDT05G
SUdfVkRQQSkgKz0gdmRwYS5vDQo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpcnRpby92ZHBh
L3ZkcGEuYyBiL2RyaXZlcnMvdmlydGlvL3ZkcGEvdmRwYS5jDQo+ID4+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0DQo+ID4+IGluZGV4IDAwMDAwMDAwMDAwMC4uMmIwZTRhOWYxMDVkDQo+ID4+ICsrKyBi
L2RyaXZlcnMvdmlydGlvL3ZkcGEvdmRwYS5jDQo+ID4+IEBAIC0wLDAgKzEsMTQxIEBADQo+ID4+
ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5DQo+ID4+ICsvKg0KPiA+
PiArICogdkRQQSBidXMuDQo+ID4+ICsgKg0KPiA+PiArICogQ29weXJpZ2h0IChjKSAyMDE5LCBS
ZWQgSGF0LiBBbGwgcmlnaHRzIHJlc2VydmVkLg0KPiA+PiArICogICAgIEF1dGhvcjogSmFzb24g
V2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4NCj4gPiAyMDIwIHRlc3RzIGRheXMNCj4gDQo+IA0K
PiBXaWxsIGZpeC4NCj4gDQo+IA0KPiA+DQo+ID4+ICsgKg0KPiA+PiArICovDQo+ID4+ICsNCj4g
Pj4gKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4gPj4gKyNpbmNsdWRlIDxsaW51eC9pZHIu
aD4NCj4gPj4gKyNpbmNsdWRlIDxsaW51eC92ZHBhLmg+DQo+ID4+ICsNCj4gPj4gKyNkZWZpbmUg
TU9EX1ZFUlNJT04gICIwLjEiDQo+ID4gSSB0aGluayBtb2R1bGUgdmVyc2lvbnMgYXJlIGRpc2Nv
dXJhZ2VkIHRoZXNlIGRheXMNCj4gDQo+IA0KPiBXaWxsIHJlbW92ZS4NCj4gDQo+IA0KPiA+DQo+
ID4+ICsjZGVmaW5lIE1PRF9ERVNDICAgICAidkRQQSBidXMiDQo+ID4+ICsjZGVmaW5lIE1PRF9B
VVRIT1IgICAiSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4iDQo+ID4+ICsjZGVmaW5l
IE1PRF9MSUNFTlNFICAiR1BMIHYyIg0KPiA+PiArDQo+ID4+ICtzdGF0aWMgREVGSU5FX0lEQSh2
ZHBhX2luZGV4X2lkYSk7DQo+ID4+ICsNCj4gPj4gK3N0cnVjdCBkZXZpY2UgKnZkcGFfZ2V0X3Bh
cmVudChzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkcGEpDQo+ID4+ICt7DQo+ID4+ICsJcmV0dXJuIHZk
cGEtPmRldi5wYXJlbnQ7DQo+ID4+ICt9DQo+ID4+ICtFWFBPUlRfU1lNQk9MKHZkcGFfZ2V0X3Bh
cmVudCk7DQo+ID4+ICsNCj4gPj4gK3ZvaWQgdmRwYV9zZXRfcGFyZW50KHN0cnVjdCB2ZHBhX2Rl
dmljZSAqdmRwYSwgc3RydWN0IGRldmljZSAqcGFyZW50KQ0KPiA+PiArew0KPiA+PiArCXZkcGEt
PmRldi5wYXJlbnQgPSBwYXJlbnQ7DQo+ID4+ICt9DQo+ID4+ICtFWFBPUlRfU1lNQk9MKHZkcGFf
c2V0X3BhcmVudCk7DQo+ID4+ICsNCj4gPj4gK3N0cnVjdCB2ZHBhX2RldmljZSAqZGV2X3RvX3Zk
cGEoc3RydWN0IGRldmljZSAqX2RldikNCj4gPj4gK3sNCj4gPj4gKwlyZXR1cm4gY29udGFpbmVy
X29mKF9kZXYsIHN0cnVjdCB2ZHBhX2RldmljZSwgZGV2KTsNCj4gPj4gK30NCj4gPj4gK0VYUE9S
VF9TWU1CT0xfR1BMKGRldl90b192ZHBhKTsNCj4gPj4gKw0KPiA+PiArc3RydWN0IGRldmljZSAq
dmRwYV90b19kZXYoc3RydWN0IHZkcGFfZGV2aWNlICp2ZHBhKQ0KPiA+PiArew0KPiA+PiArCXJl
dHVybiAmdmRwYS0+ZGV2Ow0KPiA+PiArfQ0KPiA+PiArRVhQT1JUX1NZTUJPTF9HUEwodmRwYV90
b19kZXYpOw0KPiA+IFdoeSB0aGVzZSB0cml2aWFsIGFzc2Vzc29ycz8gU2VlbXMgdW5uZWNlc3Nh
cnksIG9yIHNob3VsZCBhdCBsZWFzdCBiZQ0KPiA+IHN0YXRpYyBpbmxpbmVzIGluIGEgaGVhZGVy
DQo+IA0KPiANCj4gV2lsbCBmaXguDQo+IA0KPiANCj4gPg0KPiA+PiAraW50IHJlZ2lzdGVyX3Zk
cGFfZGV2aWNlKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRwYSkNCj4gPj4gK3sNCj4gPiBVc3VhbGx5
IHdlIHdhbnQgdG8gc2VlIHN5bWJvbHMgY29uc2lzdGVudGx5IHByZWZpeGVkIHdpdGggdmRwYV8q
LCBpcw0KPiA+IHRoZXJlIGEgcmVhc29uIHdoeSByZWdpc3Rlci91bnJlZ2lzdGVyIGFyZSBzd2Fw
cGVkPw0KPiANCj4gDQo+IEkgZm9sbG93IHRoZSBuYW1lIGZyb20gdmlydGlvLiBJIHdpbGwgc3dp
dGNoIHRvIHZkcGFfKi4NCj4gDQo+IA0KPiA+DQo+ID4+ICsJaW50IGVycjsNCj4gPj4gKw0KPiA+
PiArCWlmICghdmRwYV9nZXRfcGFyZW50KHZkcGEpKQ0KPiA+PiArCQlyZXR1cm4gLUVJTlZBTDsN
Cj4gPj4gKw0KPiA+PiArCWlmICghdmRwYS0+Y29uZmlnKQ0KPiA+PiArCQlyZXR1cm4gLUVJTlZB
TDsNCj4gPj4gKw0KPiA+PiArCWVyciA9IGlkYV9zaW1wbGVfZ2V0KCZ2ZHBhX2luZGV4X2lkYSwg
MCwgMCwgR0ZQX0tFUk5FTCk7DQo+ID4+ICsJaWYgKGVyciA8IDApDQo+ID4+ICsJCXJldHVybiAt
RUZBVUxUOw0KPiA+PiArDQo+ID4+ICsJdmRwYS0+ZGV2LmJ1cyA9ICZ2ZHBhX2J1czsNCj4gPj4g
KwlkZXZpY2VfaW5pdGlhbGl6ZSgmdmRwYS0+ZGV2KTsNCj4gPiBJTUhPIGRldmljZV9pbml0aWFs
aXplIHNob3VsZCBub3QgYmUgY2FsbGVkIGluc2lkZSBzb21ldGhpbmcgY2FsbGVkDQo+ID4gcmVn
aXN0ZXIsIHRvb29mdGVuIHdlIGZpbmQgb3V0IHRoYXQgdGhlIGNhbGxlciBkcml2ZXJzIG5lZWQg
dGhlIGRldmljZQ0KPiA+IHRvIGJlIGluaXRpYWxpemVkIGVhcmxpZXIsIGllIHRvIHVzZSB0aGUg
a3JlZiwgb3Igc29tZXRoaW5nLg0KPiA+DQo+ID4gSSBmaW5kIHRoZSBiZXN0IGZsb3cgaXMgdG8g
aGF2ZSBzb21lIGluaXQgZnVuY3Rpb24gdGhhdCBkb2VzIHRoZQ0KPiA+IGRldmljZV9pbml0aWFs
aXplIGFuZCBzZXRzIHRoZSBkZXZpY2VfbmFtZSB0aGF0IHRoZSBkcml2ZXIgY2FuIGNhbGwNCj4g
PiBlYXJseS4NCj4gDQo+IA0KPiBPaywgd2lsbCBkby4NCj4gDQo+IA0KPiA+DQo+ID4gU2hvdWxk
bid0IHRoZXJlIGJlIGEgZGV2aWNlL2RyaXZlciBtYXRjaGluZyBwcm9jZXNzIG9mIHNvbWUga2lu
ZD8NCj4gDQo+IA0KPiBUaGUgcXVlc3Rpb24gaXMgd2hhdCBkbyB3ZSB3YW50IGRvIG1hdGNoIGhl
cmUuDQo+IA0KPiAxKSAidmlydGlvIiB2cyAidmhvc3QiLCBJIGltcGxlbWVudGVkIG1hdGNoaW5n
IG1ldGhvZCBmb3IgdGhpcyBpbiBtZGV2DQo+IHNlcmllcywgYnV0IGl0IGxvb2tzIHVubmVjZXNz
YXJ5IGZvciB2RFBBIGRldmljZSBkcml2ZXIgdG8ga25vdyBhYm91dA0KPiB0aGlzLiBBbnl3YXkg
d2UgY2FuIHVzZSBzeXNmcyBkcml2ZXIgYmluZC91bmJpbmQgdG8gc3dpdGNoIGRyaXZlcnMNCj4g
MikgdmlydGlvIGRldmljZSBpZCBhbmQgdmVuZG9yIGlkLiBJJ20gbm90IHN1cmUgd2UgbmVlZCB0
aGlzIGNvbnNpZGVyDQo+IHRoZSB0d28gZHJpdmVycyBzbyBmYXIgKHZpcnRpby92aG9zdCkgYXJl
IGFsbCBidXMgZHJpdmVycy4NCj4gDQo+IFRoYW5rcw0KPiANCj4gDQo+ID4NCj4gPiBKYXNvbg0K
PiA+DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZp
cnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3Vu
ZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0
aW5mby92aXJ0dWFsaXphdGlvbg==
