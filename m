Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFB6B7E7C
	for <lists.virtualization@lfdr.de>; Thu, 19 Sep 2019 17:48:48 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 906C5C3A;
	Thu, 19 Sep 2019 15:48:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BDE3CB7A
	for <virtualization@lists.linux-foundation.org>;
	Thu, 19 Sep 2019 15:48:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 42F62711
	for <virtualization@lists.linux-foundation.org>;
	Thu, 19 Sep 2019 15:48:40 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Sep 2019 08:48:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,524,1559545200"; d="scan'208";a="362555450"
Received: from dpdk-virtio-tbie-2.sh.intel.com (HELO ___) ([10.67.104.71])
	by orsmga005.jf.intel.com with ESMTP; 19 Sep 2019 08:48:36 -0700
Date: Thu, 19 Sep 2019 23:45:52 +0800
From: Tiwei Bie <tiwei.bie@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [RFC v4 0/3] vhost: introduce mdev based hardware backend
Message-ID: <20190919154552.GA27657@___>
References: <20190917010204.30376-1-tiwei.bie@intel.com>
	<993841ed-942e-c90b-8016-8e7dc76bf13a@redhat.com>
	<20190917105801.GA24855@___>
	<fa6957f3-19ad-f351-8c43-65bc8342b82e@redhat.com>
	<20190918102923-mutt-send-email-mst@kernel.org>
	<d2efe7e4-cf13-437d-e2dc-e2779fac7d2f@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d2efe7e4-cf13-437d-e2dc-e2779fac7d2f@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	zhihong.wang@intel.com, maxime.coquelin@redhat.com, lingshan.zhu@intel.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

T24gVGh1LCBTZXAgMTksIDIwMTkgYXQgMDk6MDg6MTFQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiBPbiAyMDE5LzkvMTgg5LiL5Y2IMTA6MzIsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToK
PiA+ID4gPiA+IFNvIEkgaGF2ZSBzb21lIHF1ZXN0aW9uczoKPiA+ID4gPiA+IAo+ID4gPiA+ID4g
MSkgQ29tcGFyZWQgdG8gbWV0aG9kIDIsIHdoYXQncyB0aGUgYWR2YW50YWdlIG9mIGNyZWF0aW5n
IGEgbmV3IHZob3N0IGNoYXIKPiA+ID4gPiA+IGRldmljZT8gSSBndWVzcyBpdCdzIGZvciBrZWVw
IHRoZSBBUEkgY29tcGF0aWJpbGl0eT8KPiA+ID4gPiBPbmUgYmVuZWZpdCBpcyB0aGF0IHdlIGNh
biBhdm9pZCBkb2luZyB2aG9zdCBpb2N0bHMgb24KPiA+ID4gPiBWRklPIGRldmljZSBmZC4KPiA+
ID4gWWVzLCBidXQgYW55IGJlbmVmaXQgZnJvbSBkb2luZyB0aGlzPwo+ID4gSXQgZG9lcyBzZWVt
IGEgYml0IG1vcmUgbW9kdWxhciwgYnV0IGl0J3MgY2VydGFpbmx5IG5vdCBhIGJpZyBkZWFsLgo+
IAo+IE9rLCBpZiB3ZSBnbyB0aGlzIHdheSwgaXQgY291bGQgYmUgYXMgc2ltcGxlIGFzIHByb3Zp
ZGUgc29tZSBjYWxsYmFjayB0bwo+IHZob3N0LCB0aGVuIHZob3N0IGNhbiBqdXN0IGZvcndhcmQg
dGhlIGlvY3RsIHRocm91Z2ggcGFyZW50X29wcy4KPiAKPiA+IAo+ID4gPiA+ID4gMikgRm9yIG1l
dGhvZCAyLCBpcyB0aGVyZSBhbnkgZWFzeSB3YXkgZm9yIHVzZXIvYWRtaW4gdG8gZGlzdGluZ3Vp
c2ggZS5nCj4gPiA+ID4gPiBvcmRpbmFyeSB2ZmlvLW1kZXYgZm9yIHZob3N0IGZyb20gb3JkaW5h
cnkgdmZpby1tZGV2Pwo+ID4gPiA+IEkgdGhpbmsgZGV2aWNlLWFwaSBjb3VsZCBiZSBhIGNob2lj
ZS4KPiA+ID4gT2suCj4gPiA+IAo+ID4gPiAKPiA+ID4gPiA+IEkgc2F3IHlvdSBpbnRyb2R1Y2UK
PiA+ID4gPiA+IG9wcyBtYXRjaGluZyBoZWxwZXIgYnV0IGl0J3Mgbm90IGZyaWVuZGx5IHRvIG1h
bmFnZW1lbnQuCj4gPiA+ID4gVGhlIG9wcyBtYXRjaGluZyBoZWxwZXIgaXMganVzdCB0byBjaGVj
ayB3aGV0aGVyIGEgZ2l2ZW4KPiA+ID4gPiB2ZmlvLWRldmljZSBpcyBiYXNlZCBvbiBhIG1kZXYg
ZGV2aWNlLgo+ID4gPiA+IAo+ID4gPiA+ID4gMykgQSBkcmF3YmFjayBvZiAxKSBhbmQgMikgaXMg
dGhhdCBpdCBtdXN0IGZvbGxvdyB2ZmlvX2RldmljZV9vcHMgdGhhdAo+ID4gPiA+ID4gYXNzdW1l
cyB0aGUgcGFyYW1ldGVyIGNvbWVzIGZyb20gdXNlcnNwYWNlLCBpdCBwcmV2ZW50cyBzdXBwb3J0
IGtlcm5lbAo+ID4gPiA+ID4gdmlydGlvIGRyaXZlcnMuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IDQp
IFNvIGNvbWVzIHRoZSBpZGVhIG9mIG1ldGhvZCAzLCBzaW5jZSBpdCByZWdpc3RlciBhIG5ldyB2
aG9zdC1tZGV2IGRyaXZlciwKPiA+ID4gPiA+IHdlIGNhbiB1c2UgZGV2aWNlIHNwZWNpZmljIG9w
cyBpbnN0ZWFkIG9mIFZGSU8gb25lcywgdGhlbiB3ZSBjYW4gaGF2ZSBhCj4gPiA+ID4gPiBjb21t
b24gQVBJIGJldHdlZW4gdkRQQSBwYXJlbnQgYW5kIHZob3N0LW1kZXYvdmlydGlvLW1kZXYgZHJp
dmVycy4KPiA+ID4gPiBBcyB0aGUgYWJvdmUgZHJhZnQgc2hvd3MsIHRoaXMgcmVxdWlyZXMgaW50
cm9kdWNpbmcgYSBuZXcKPiA+ID4gPiBWRklPIGRldmljZSBkcml2ZXIuIEkgdGhpbmsgQWxleCdz
IG9waW5pb24gbWF0dGVycyBoZXJlLgo+IAo+IEp1c3QgdG8gY2xhcmlmeSwgYSBuZXcgdHlwZSBv
ZiBtZGV2IGRyaXZlciBidXQgcHJvdmlkZXMgZHVtbXkKPiB2ZmlvX2RldmljZV9vcHMgZm9yIFZG
SU8gdG8gbWFrZSBjb250YWluZXIgRE1BIGlvY3RsIHdvcmsuCgpJIHNlZS4gVGhhbmtzISBJSVVD
LCB5b3UgbWVhbiB3ZSBjYW4gcHJvdmlkZSBhIHZlcnkgdGlueQpWRklPIGRldmljZSBkcml2ZXIg
aW4gZHJpdmVycy92aG9zdC9tZGV2LmMsIGUuZy46CgpzdGF0aWMgaW50IHZmaW9fdmhvc3RfbWRl
dl9vcGVuKHZvaWQgKmRldmljZV9kYXRhKQp7CglpZiAoIXRyeV9tb2R1bGVfZ2V0KFRISVNfTU9E
VUxFKSkKCQlyZXR1cm4gLUVOT0RFVjsKCXJldHVybiAwOwp9CgpzdGF0aWMgdm9pZCB2ZmlvX3Zo
b3N0X21kZXZfcmVsZWFzZSh2b2lkICpkZXZpY2VfZGF0YSkKewoJbW9kdWxlX3B1dChUSElTX01P
RFVMRSk7Cn0KCnN0YXRpYyBjb25zdCBzdHJ1Y3QgdmZpb19kZXZpY2Vfb3BzIHZmaW9fdmhvc3Rf
bWRldl9kZXZfb3BzID0gewoJLm5hbWUJCT0gInZmaW8tdmhvc3QtbWRldiIsCgkub3BlbgkJPSB2
ZmlvX3Zob3N0X21kZXZfb3BlbiwKCS5yZWxlYXNlCT0gdmZpb192aG9zdF9tZGV2X3JlbGVhc2Us
Cn07CgpzdGF0aWMgaW50IHZob3N0X21kZXZfcHJvYmUoc3RydWN0IGRldmljZSAqZGV2KQp7Cglz
dHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYgPSB0b19tZGV2X2RldmljZShkZXYpOwoKCS4uLiBDaGVj
ayB0aGUgbWRldiBkZXZpY2VfaWQgcHJvcG9zZWQgaW4gLi4uCgkuLi4gaHR0cHM6Ly9sa21sLm9y
Zy9sa21sLzIwMTkvOS8xMi8xNTEgLi4uCgoJcmV0dXJuIHZmaW9fYWRkX2dyb3VwX2RldihkZXYs
ICZ2ZmlvX3Zob3N0X21kZXZfZGV2X29wcywgbWRldik7Cn0KCnN0YXRpYyB2b2lkIHZob3N0X21k
ZXZfcmVtb3ZlKHN0cnVjdCBkZXZpY2UgKmRldikKewoJdmZpb19kZWxfZ3JvdXBfZGV2KGRldik7
Cn0KCnN0YXRpYyBzdHJ1Y3QgbWRldl9kcml2ZXIgdmhvc3RfbWRldl9kcml2ZXIgPSB7CgkubmFt
ZQk9ICJ2aG9zdF9tZGV2IiwKCS5wcm9iZQk9IHZob3N0X21kZXZfcHJvYmUsCgkucmVtb3ZlCT0g
dmhvc3RfbWRldl9yZW1vdmUsCn07CgpTbyB3ZSBjYW4gYmluZCBhYm92ZSBtZGV2IGRyaXZlciB0
byB0aGUgdmlydGlvLW1kZXYgY29tcGF0aWJsZQptZGV2IGRldmljZXMgd2hlbiB3ZSB3YW50IHRv
IHVzZSB2aG9zdC1tZGV2LgoKQWZ0ZXIgYmluZGluZyBhYm92ZSBkcml2ZXIgdG8gdGhlIG1kZXYg
ZGV2aWNlLCB3ZSBjYW4gc2V0dXAgSU9NTVUKdmlhIFZGSU8gYW5kIGdldCBWRklPIGRldmljZSBm
ZCBvZiB0aGlzIG1kZXYgZGV2aWNlLCBhbmQgcGFzcyBpdAp0byB2aG9zdCBmZCAoL2Rldi92aG9z
dC1tZGV2KSB3aXRoIGEgU0VUX0JBQ0tFTkQgaW9jdGwuCgpUaGFua3MsClRpd2VpCgo+IAo+IFRo
YW5rcwo+IAo+IAo+ID4gPiBZZXMsIGl0IGlzLgo+ID4gPiAKPiA+ID4gVGhhbmtzCj4gPiA+IAo+
ID4gPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmly
dHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5k
YXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3ZpcnR1YWxpemF0aW9u
