Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AA48FE9626
	for <lists.virtualization@lfdr.de>; Wed, 30 Oct 2019 06:51:52 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7303BE1E;
	Wed, 30 Oct 2019 05:51:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id F0927C90
	for <virtualization@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 05:51:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 30CF68A
	for <virtualization@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 05:51:42 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Oct 2019 22:51:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,246,1569308400"; d="scan'208";a="400031177"
Received: from dpdk-virtio-tbie-2.sh.intel.com (HELO ___) ([10.67.104.74])
	by fmsmga005.fm.intel.com with ESMTP; 29 Oct 2019 22:51:37 -0700
Date: Wed, 30 Oct 2019 13:52:28 +0800
From: Tiwei Bie <tiwei.bie@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v3] vhost: introduce mdev based hardware backend
Message-ID: <20191030055228.GA9578@___>
References: <20191029100734.9861-1-tiwei.bie@intel.com>
	<e653058c-d480-2195-8915-7bf7378ac76e@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e653058c-d480-2195-8915-7bf7378ac76e@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
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

T24gV2VkLCBPY3QgMzAsIDIwMTkgYXQgMDk6NTU6NTdBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiBPbiAyMDE5LzEwLzI5IOS4i+WNiDY6MDcsIFRpd2VpIEJpZSB3cm90ZToKPiA+IFRoaXMg
cGF0Y2ggaW50cm9kdWNlcyBhIG1kZXYgYmFzZWQgaGFyZHdhcmUgdmhvc3QgYmFja2VuZC4KPiA+
IFRoaXMgYmFja2VuZCBpcyBidWlsdCBvbiB0b3Agb2YgdGhlIHNhbWUgYWJzdHJhY3Rpb24gdXNl
ZAo+ID4gaW4gdmlydGlvLW1kZXYgYW5kIHByb3ZpZGVzIGEgZ2VuZXJpYyB2aG9zdCBpbnRlcmZh
Y2UgZm9yCj4gPiB1c2Vyc3BhY2UgdG8gYWNjZWxlcmF0ZSB0aGUgdmlydGlvIGRldmljZXMgaW4g
Z3Vlc3QuCj4gPgo+ID4gVGhpcyBiYWNrZW5kIGlzIGltcGxlbWVudGVkIGFzIGEgbWRldiBkZXZp
Y2UgZHJpdmVyIG9uIHRvcAo+ID4gb2YgdGhlIHNhbWUgbWRldiBkZXZpY2Ugb3BzIHVzZWQgaW4g
dmlydGlvLW1kZXYgYnV0IHVzaW5nCj4gPiBhIGRpZmZlcmVudCBtZGV2IGNsYXNzIGlkLCBhbmQg
aXQgd2lsbCByZWdpc3RlciB0aGUgZGV2aWNlCj4gPiBhcyBhIFZGSU8gZGV2aWNlIGZvciB1c2Vy
c3BhY2UgdG8gdXNlLiBVc2Vyc3BhY2UgY2FuIHNldHVwCj4gPiB0aGUgSU9NTVUgd2l0aCB0aGUg
ZXhpc3RpbmcgVkZJTyBjb250YWluZXIvZ3JvdXAgQVBJcyBhbmQKPiA+IHRoZW4gZ2V0IHRoZSBk
ZXZpY2UgZmQgd2l0aCB0aGUgZGV2aWNlIG5hbWUuIEFmdGVyIGdldHRpbmcKPiA+IHRoZSBkZXZp
Y2UgZmQgb2YgdGhpcyBkZXZpY2UsIHVzZXJzcGFjZSBjYW4gdXNlIHZob3N0IGlvY3Rscwo+ID4g
dG8gc2V0dXAgdGhlIGJhY2tlbmQuCj4gCj4gCj4gSGkgVGl3ZWk6Cj4gCj4gVGhlIHBhdGNoIGxv
b2tzIGdvb2Qgb3ZlcmFsbCwganVzdCBmZXcgY29tbWVudHMgJiBuaXRzLgoKVGhhbmtzIGZvciB0
aGUgcmV2aWV3ISBJIGRvIGFwcHJlY2lhdGUgaXQuCgo+IAo+IAo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IFRpd2VpIEJpZSA8dGl3ZWkuYmllQGludGVsLmNvbT4KPiA+IC0tLQo+ID4gVGhpcyBwYXRj
aCBkZXBlbmRzIG9uIGJlbG93IHNlcmllczoKPiA+IGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5
LzEwLzIzLzYxNAo+ID4KPiA+IHYyIC0+IHYzOgo+ID4gLSBGaXggdGhlIHJldHVybiB2YWx1ZSAo
SmFzb24pOwo+ID4gLSBEb24ndCBjYWNoZSB1bm5lY2Vzc2FyeSBpbmZvcm1hdGlvbiBpbiB2aG9z
dC1tZGV2IChKYXNvbik7Cj4gPiAtIEdldCByaWQgb2YgdGhlIG1lbXNldCBpbiBvcGVuIChKYXNv
bik7Cj4gPiAtIEFkZCBjb21tZW50cyBmb3IgVkhPU1RfU0VUX01FTV9UQUJMRSwgLi4uIChKYXNv
bik7Cj4gPiAtIEZpbHRlciBvdXQgdW5zdXBwb3J0ZWQgZmVhdHVyZXMgaW4gdmhvc3QtbWRldiAo
SmFzb24pOwo+ID4gLSBBZGQgX0dFVF9ERVZJQ0VfSUQgaW9jdGwgKEphc29uKTsKPiA+IC0gQWRk
IF9HRVRfQ09ORklHL19TRVRfQ09ORklHIGlvY3RscyAoSmFzb24pOwo+ID4gLSBEcm9wIF9HRVRf
UVVFVUVfTlVNIGlvY3RsIChKYXNvbik7Cj4gPiAtIEZpeCB0aGUgY29weS1wYXN0ZSBlcnJvcnMg
aW4gX0lPVy9fSU9SIHVzYWdlOwo+ID4gLSBTb21lIG1pbm9yIGZpeGVzIGFuZCBpbXByb3ZlbWVu
dHM7Cj4gPgo+ID4gdjEgLT4gdjI6Cj4gPiAtIFJlcGxhY2UgX1NFVF9TVEFURSB3aXRoIF9TRVRf
U1RBVFVTIChNU1QpOwo+ID4gLSBDaGVjayBzdGF0dXMgYml0cyBhdCBlYWNoIHN0ZXAgKE1TVCk7
Cj4gPiAtIFJlcG9ydCB0aGUgbWF4IHJpbmcgc2l6ZSBhbmQgbWF4IG51bWJlciBvZiBxdWV1ZXMg
KE1TVCk7Cj4gPiAtIEFkZCBtaXNzaW5nIE1PRFVMRV9ERVZJQ0VfVEFCTEUgKEphc29uKTsKPiA+
IC0gT25seSBzdXBwb3J0IHRoZSBuZXR3b3JrIGJhY2tlbmQgdy9vIG11bHRpcXVldWUgZm9yIG5v
dzsKPiA+IC0gU29tZSBtaW5vciBmaXhlcyBhbmQgaW1wcm92ZW1lbnRzOwo+ID4gLSBSZWJhc2Ug
b24gdG9wIG9mIHZpcnRpby1tZGV2IHNlcmllcyB2NDsKPiA+Cj4gPiBSRkMgdjQgLT4gdjE6Cj4g
PiAtIEltcGxlbWVudCB2aG9zdC1tZGV2IGFzIGEgbWRldiBkZXZpY2UgZHJpdmVyIGRpcmVjdGx5
IGFuZAo+ID4gICBjb25uZWN0IGl0IHRvIFZGSU8gY29udGFpbmVyL2dyb3VwLiAoSmFzb24pOwo+
ID4gLSBQYXNzIHJpbmcgYWRkcmVzc2VzIGFzIEdQQXMvSU9WQXMgaW4gdmhvc3QtbWRldiB0byBh
dm9pZAo+ID4gICBtZWFuaW5nbGVzcyBIVkEtPkdQQSB0cmFuc2xhdGlvbnMgKEphc29uKTsKPiA+
Cj4gPiBSRkMgdjMgLT4gUkZDIHY0Ogo+ID4gLSBCdWlsZCB2aG9zdC1tZGV2IG9uIHRvcCBvZiB0
aGUgc2FtZSBhYnN0cmFjdGlvbiB1c2VkIGJ5Cj4gPiAgIHZpcnRpby1tZGV2IChKYXNvbik7Cj4g
PiAtIEludHJvZHVjZSB2aG9zdCBmZCBhbmQgcGFzcyBWRklPIGZkIHZpYSBTRVRfQkFDS0VORCBp
b2N0bCAoTVNUKTsKPiA+Cj4gPiBSRkMgdjIgLT4gUkZDIHYzOgo+ID4gLSBSZXVzZSB2aG9zdCdz
IGlvY3RscyBpbnN0ZWFkIG9mIGludmVudGluZyBhIFZGSU8gcmVnaW9ucy9pcnFzCj4gPiAgIGJh
c2VkIHZob3N0IHByb3RvY29sIG9uIHRvcCBvZiB2ZmlvLW1kZXYgKEphc29uKTsKPiA+Cj4gPiBS
RkMgdjEgLT4gUkZDIHYyOgo+ID4gLSBJbnRyb2R1Y2UgYSBuZXcgVkZJTyBkZXZpY2UgdHlwZSB0
byBidWlsZCBhIHZob3N0IHByb3RvY29sCj4gPiAgIG9uIHRvcCBvZiB2ZmlvLW1kZXY7Cj4gPgo+
ID4gIGRyaXZlcnMvdmZpby9tZGV2L21kZXZfY29yZS5jICAgIHwgIDIwICsrCj4gPiAgZHJpdmVy
cy92ZmlvL21kZXYvbWRldl9wcml2YXRlLmggfCAgIDEgKwo+ID4gIGRyaXZlcnMvdmhvc3QvS2Nv
bmZpZyAgICAgICAgICAgIHwgIDEyICsKPiA+ICBkcml2ZXJzL3Zob3N0L01ha2VmaWxlICAgICAg
ICAgICB8ICAgMyArCj4gPiAgZHJpdmVycy92aG9zdC9tZGV2LmMgICAgICAgICAgICAgfCA1NTQg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIGluY2x1ZGUvbGludXgvbWRldi5o
ICAgICAgICAgICAgIHwgICA1ICsKPiA+ICBpbmNsdWRlL3VhcGkvbGludXgvdmhvc3QuaCAgICAg
ICB8ICAxOCArCj4gPiAgaW5jbHVkZS91YXBpL2xpbnV4L3Zob3N0X3R5cGVzLmggfCAgIDggKwo+
ID4gIDggZmlsZXMgY2hhbmdlZCwgNjIxIGluc2VydGlvbnMoKykKPiA+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgZHJpdmVycy92aG9zdC9tZGV2LmMKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92
ZmlvL21kZXYvbWRldl9jb3JlLmMgYi9kcml2ZXJzL3ZmaW8vbWRldi9tZGV2X2NvcmUuYwo+ID4g
aW5kZXggOWIwMGMzNTEzMTIwLi4zY2ZkNzg3ZDYwNWMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJz
L3ZmaW8vbWRldi9tZGV2X2NvcmUuYwo+ID4gKysrIGIvZHJpdmVycy92ZmlvL21kZXYvbWRldl9j
b3JlLmMKPiA+IEBAIC05Niw2ICs5NiwyNiBAQCBtZGV2X2dldF92aXJ0aW9fb3BzKHN0cnVjdCBt
ZGV2X2RldmljZSAqbWRldikKPiA+ICB9Cj4gPiAgRVhQT1JUX1NZTUJPTChtZGV2X2dldF92aXJ0
aW9fb3BzKTsKPiA+ICAKPiA+ICsvKiBTcGVjaWZ5IHRoZSB2aG9zdCBkZXZpY2Ugb3BzIGZvciB0
aGUgbWRldiBkZXZpY2UsIHRoaXMKPiA+ICsgKiBtdXN0IGJlIGNhbGxlZCBkdXJpbmcgY3JlYXRl
KCkgY2FsbGJhY2sgZm9yIHZob3N0IG1kZXYgZGV2aWNlLgo+ID4gKyAqLwo+ID4gK3ZvaWQgbWRl
dl9zZXRfdmhvc3Rfb3BzKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldiwKPiA+ICsJCQljb25zdCBz
dHJ1Y3QgdmlydGlvX21kZXZfZGV2aWNlX29wcyAqdmhvc3Rfb3BzKQo+ID4gK3sKPiA+ICsJbWRl
dl9zZXRfY2xhc3MobWRldiwgTURFVl9DTEFTU19JRF9WSE9TVCk7Cj4gPiArCW1kZXYtPnZob3N0
X29wcyA9IHZob3N0X29wczsKPiA+ICt9Cj4gPiArRVhQT1JUX1NZTUJPTChtZGV2X3NldF92aG9z
dF9vcHMpOwo+ID4gKwo+ID4gKy8qIEdldCB0aGUgdmhvc3QgZGV2aWNlIG9wcyBmb3IgdGhlIG1k
ZXYgZGV2aWNlLiAqLwo+ID4gK2NvbnN0IHN0cnVjdCB2aXJ0aW9fbWRldl9kZXZpY2Vfb3BzICoK
PiA+ICttZGV2X2dldF92aG9zdF9vcHMoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2KQo+ID4gK3sK
PiA+ICsJV0FSTl9PTihtZGV2LT5jbGFzc19pZCAhPSBNREVWX0NMQVNTX0lEX1ZIT1NUKTsKPiA+
ICsJcmV0dXJuIG1kZXYtPnZob3N0X29wczsKPiA+ICt9Cj4gPiArRVhQT1JUX1NZTUJPTChtZGV2
X2dldF92aG9zdF9vcHMpOwo+ID4gKwo+ID4gIHN0cnVjdCBkZXZpY2UgKm1kZXZfZGV2KHN0cnVj
dCBtZGV2X2RldmljZSAqbWRldikKPiA+ICB7Cj4gPiAgCXJldHVybiAmbWRldi0+ZGV2Owo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmZpby9tZGV2L21kZXZfcHJpdmF0ZS5oIGIvZHJpdmVycy92
ZmlvL21kZXYvbWRldl9wcml2YXRlLmgKPiA+IGluZGV4IDdiNDc4OTBjMzRlNy4uNTU5N2M4NDZl
NTJmIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy92ZmlvL21kZXYvbWRldl9wcml2YXRlLmgKPiA+
ICsrKyBiL2RyaXZlcnMvdmZpby9tZGV2L21kZXZfcHJpdmF0ZS5oCj4gPiBAQCAtNDAsNiArNDAs
NyBAQCBzdHJ1Y3QgbWRldl9kZXZpY2Ugewo+ID4gIAl1bmlvbiB7Cj4gPiAgCQljb25zdCBzdHJ1
Y3QgdmZpb19tZGV2X2RldmljZV9vcHMgKnZmaW9fb3BzOwo+ID4gIAkJY29uc3Qgc3RydWN0IHZp
cnRpb19tZGV2X2RldmljZV9vcHMgKnZpcnRpb19vcHM7Cj4gPiArCQljb25zdCBzdHJ1Y3Qgdmly
dGlvX21kZXZfZGV2aWNlX29wcyAqdmhvc3Rfb3BzOwo+ID4gIAl9Owo+ID4gIH07Cj4gPiAgCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aG9zdC9LY29uZmlnIGIvZHJpdmVycy92aG9zdC9LY29u
ZmlnCj4gPiBpbmRleCAzZDAzY2NiZDFhZGMuLjA2MmNhZGEyOGY4OSAxMDA2NDQKPiA+IC0tLSBh
L2RyaXZlcnMvdmhvc3QvS2NvbmZpZwo+ID4gKysrIGIvZHJpdmVycy92aG9zdC9LY29uZmlnCj4g
PiBAQCAtMzQsNiArMzQsMTggQEAgY29uZmlnIFZIT1NUX1ZTT0NLCj4gPiAgCVRvIGNvbXBpbGUg
dGhpcyBkcml2ZXIgYXMgYSBtb2R1bGUsIGNob29zZSBNIGhlcmU6IHRoZSBtb2R1bGUgd2lsbCBi
ZSBjYWxsZWQKPiA+ICAJdmhvc3RfdnNvY2suCj4gPiAgCj4gPiArY29uZmlnIFZIT1NUX01ERVYK
PiA+ICsJdHJpc3RhdGUgIlZob3N0IGRyaXZlciBmb3IgTWVkaWF0ZWQgZGV2aWNlcyIKPiA+ICsJ
ZGVwZW5kcyBvbiBFVkVOVEZEICYmIFZGSU8gJiYgVkZJT19NREVWCj4gPiArCXNlbGVjdCBWSE9T
VAo+ID4gKwlkZWZhdWx0IG4KPiA+ICsJLS0taGVscC0tLQo+ID4gKwlUaGlzIGtlcm5lbCBtb2R1
bGUgY2FuIGJlIGxvYWRlZCBpbiBob3N0IGtlcm5lbCB0byBhY2NlbGVyYXRlCj4gPiArCWd1ZXN0
IHZpcnRpbyBkZXZpY2VzIHdpdGggdGhlIG1lZGlhdGVkIGRldmljZSBiYXNlZCBiYWNrZW5kcy4K
PiA+ICsKPiA+ICsJVG8gY29tcGlsZSB0aGlzIGRyaXZlciBhcyBhIG1vZHVsZSwgY2hvb3NlIE0g
aGVyZTogdGhlIG1vZHVsZSB3aWxsCj4gPiArCWJlIGNhbGxlZCB2aG9zdF9tZGV2Lgo+ID4gKwo+
ID4gIGNvbmZpZyBWSE9TVAo+ID4gIAl0cmlzdGF0ZQo+ID4gIAktLS1oZWxwLS0tCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy92aG9zdC9NYWtlZmlsZSBiL2RyaXZlcnMvdmhvc3QvTWFrZWZpbGUK
PiA+IGluZGV4IDZjNmRmMjRmNzcwYy4uYWQ5YzBmOGM2ZDhjIDEwMDY0NAo+ID4gLS0tIGEvZHJp
dmVycy92aG9zdC9NYWtlZmlsZQo+ID4gKysrIGIvZHJpdmVycy92aG9zdC9NYWtlZmlsZQo+ID4g
QEAgLTEwLDQgKzEwLDcgQEAgdmhvc3RfdnNvY2steSA6PSB2c29jay5vCj4gPiAgCj4gPiAgb2Jq
LSQoQ09ORklHX1ZIT1NUX1JJTkcpICs9IHZyaW5naC5vCj4gPiAgCj4gPiArb2JqLSQoQ09ORklH
X1ZIT1NUX01ERVYpICs9IHZob3N0X21kZXYubwo+ID4gK3Zob3N0X21kZXYteSA6PSBtZGV2Lm8K
PiA+ICsKPiA+ICBvYmotJChDT05GSUdfVkhPU1QpCSs9IHZob3N0Lm8KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3Zob3N0L21kZXYuYyBiL2RyaXZlcnMvdmhvc3QvbWRldi5jCj4gPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi4zNWIyZmIzM2U2ODYKPiA+IC0t
LSAvZGV2L251bGwKPiA+ICsrKyBiL2RyaXZlcnMvdmhvc3QvbWRldi5jCj4gPiBAQCAtMCwwICsx
LDU1NCBAQAo+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gPiArLyoK
PiA+ICsgKiBWaG9zdCBkcml2ZXIgZm9yIG1lZGlhdGVkIGRldmljZSBiYXNlZCBiYWNrZW5kcy4K
PiA+ICsgKgo+ID4gKyAqIENvcHlyaWdodCAoQykgMjAxOC0yMDE5IEludGVsIENvcnBvcmF0aW9u
Lgo+ID4gKyAqCj4gPiArICogQXV0aG9yOiBUaXdlaSBCaWUgPHRpd2VpLmJpZUBpbnRlbC5jb20+
Cj4gPiArICoKPiA+ICsgKiBUaGFua3MgdG8gSmFzb24gV2FuZyBhbmQgTWljaGFlbCBTLiBUc2ly
a2luIGZvciB0aGUgdmFsdWFibGUKPiA+ICsgKiBjb21tZW50cyBhbmQgc3VnZ2VzdGlvbnMuICBB
bmQgdGhhbmtzIHRvIEN1bm1pbmcgTGlhbmcgYW5kCj4gPiArICogWmhpaG9uZyBXYW5nIGZvciBh
bGwgdGhlaXIgc3VwcG9ydHMuCj4gPiArICovCj4gPiArCj4gPiArI2luY2x1ZGUgPGxpbnV4L2tl
cm5lbC5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPiA+ICsjaW5jbHVkZSA8bGlu
dXgvbWRldi5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC92ZmlvLmg+Cj4gPiArI2luY2x1ZGUgPGxp
bnV4L3Zob3N0Lmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L3ZpcnRpb19uZXQuaD4KPiA+ICsjaW5j
bHVkZSA8bGludXgvdmlydGlvX21kZXZfb3BzLmg+Cj4gPiArCj4gPiArI2luY2x1ZGUgInZob3N0
LmgiCj4gPiArCj4gPiArZW51bSB7Cj4gPiArCVZIT1NUX01ERVZfRkVBVFVSRVMgPQo+ID4gKwkJ
KDFVTEwgPDwgVklSVElPX0ZfTk9USUZZX09OX0VNUFRZKSB8Cj4gPiArCQkoMVVMTCA8PCBWSVJU
SU9fRl9BTllfTEFZT1VUKSB8Cj4gPiArCQkoMVVMTCA8PCBWSVJUSU9fRl9WRVJTSU9OXzEpIHwK
PiA+ICsJCSgxVUxMIDw8IFZJUlRJT19GX0lPTU1VX1BMQVRGT1JNKSB8Cj4gPiArCQkoMVVMTCA8
PCBWSVJUSU9fRl9SSU5HX1BBQ0tFRCkgfAo+ID4gKwkJKDFVTEwgPDwgVklSVElPX0ZfT1JERVJf
UExBVEZPUk0pIHwKPiA+ICsJCSgxVUxMIDw8IFZJUlRJT19SSU5HX0ZfSU5ESVJFQ1RfREVTQykg
fAo+ID4gKwkJKDFVTEwgPDwgVklSVElPX1JJTkdfRl9FVkVOVF9JRFgpLAo+ID4gKwo+ID4gKwlW
SE9TVF9NREVWX05FVF9GRUFUVVJFUyA9IFZIT1NUX01ERVZfRkVBVFVSRVMgfAo+ID4gKwkJKDFV
TEwgPDwgVklSVElPX05FVF9GX0NTVU0pIHwKPiA+ICsJCSgxVUxMIDw8IFZJUlRJT19ORVRfRl9H
VUVTVF9DU1VNKSB8Cj4gPiArCQkoMVVMTCA8PCBWSVJUSU9fTkVUX0ZfTVRVKSB8Cj4gPiArCQko
MVVMTCA8PCBWSVJUSU9fTkVUX0ZfTUFDKSB8Cj4gPiArCQkoMVVMTCA8PCBWSVJUSU9fTkVUX0Zf
R1VFU1RfVFNPNCkgfAo+ID4gKwkJKDFVTEwgPDwgVklSVElPX05FVF9GX0dVRVNUX1RTTzYpIHwK
PiA+ICsJCSgxVUxMIDw8IFZJUlRJT19ORVRfRl9HVUVTVF9FQ04pIHwKPiA+ICsJCSgxVUxMIDw8
IFZJUlRJT19ORVRfRl9HVUVTVF9VRk8pIHwKPiA+ICsJCSgxVUxMIDw8IFZJUlRJT19ORVRfRl9I
T1NUX1RTTzQpIHwKPiA+ICsJCSgxVUxMIDw8IFZJUlRJT19ORVRfRl9IT1NUX1RTTzYpIHwKPiA+
ICsJCSgxVUxMIDw8IFZJUlRJT19ORVRfRl9IT1NUX0VDTikgfAo+ID4gKwkJKDFVTEwgPDwgVklS
VElPX05FVF9GX0hPU1RfVUZPKSB8Cj4gPiArCQkoMVVMTCA8PCBWSVJUSU9fTkVUX0ZfTVJHX1JY
QlVGKSB8Cj4gPiArCQkoMVVMTCA8PCBWSVJUSU9fTkVUX0ZfU1RBVFVTKSB8Cj4gPiArCQkoMVVM
TCA8PCBWSVJUSU9fTkVUX0ZfU1BFRURfRFVQTEVYKSwKPiA+ICt9Owo+ID4gKwo+ID4gKy8qIEN1
cnJlbnRseSwgb25seSBuZXR3b3JrIGJhY2tlbmQgdy9vIG11bHRpcXVldWUgaXMgc3VwcG9ydGVk
LiAqLwo+ID4gKyNkZWZpbmUgVkhPU1RfTURFVl9WUV9NQVgJMgo+ID4gKwo+ID4gK3N0cnVjdCB2
aG9zdF9tZGV2IHsKPiA+ICsJLyogVGhlIGxvY2sgaXMgdG8gcHJvdGVjdCB0aGlzIHN0cnVjdHVy
ZS4gKi8KPiA+ICsJc3RydWN0IG11dGV4IG11dGV4Owo+ID4gKwlzdHJ1Y3Qgdmhvc3RfZGV2IGRl
djsKPiA+ICsJc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAqdnFzOwo+ID4gKwlpbnQgbnZxczsKPiA+
ICsJaW50IHZpcnRpb19pZDsKPiA+ICsJYm9vbCBvcGVuZWQ7Cj4gPiArCXN0cnVjdCBtZGV2X2Rl
dmljZSAqbWRldjsKPiA+ICt9Owo+ID4gKwo+ID4gK3N0YXRpYyBjb25zdCB1NjQgdmhvc3RfbWRl
dl9mZWF0dXJlc1tdID0gewo+ID4gKwlbVklSVElPX0lEX05FVF0gPSBWSE9TVF9NREVWX05FVF9G
RUFUVVJFUywKPiA+ICt9Owo+ID4gKwo+ID4gK3N0YXRpYyB2b2lkIGhhbmRsZV92cV9raWNrKHN0
cnVjdCB2aG9zdF93b3JrICp3b3JrKQo+ID4gK3sKPiA+ICsJc3RydWN0IHZob3N0X3ZpcnRxdWV1
ZSAqdnEgPSBjb250YWluZXJfb2Yod29yaywgc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSwKPiA+ICsJ
CQkJCQkgIHBvbGwud29yayk7Cj4gPiArCXN0cnVjdCB2aG9zdF9tZGV2ICptID0gY29udGFpbmVy
X29mKHZxLT5kZXYsIHN0cnVjdCB2aG9zdF9tZGV2LCBkZXYpOwo+ID4gKwljb25zdCBzdHJ1Y3Qg
dmlydGlvX21kZXZfZGV2aWNlX29wcyAqb3BzID0gbWRldl9nZXRfdmhvc3Rfb3BzKG0tPm1kZXYp
Owo+ID4gKwo+ID4gKwlvcHMtPmtpY2tfdnEobS0+bWRldiwgdnEgLSBtLT52cXMpOwo+ID4gK30K
PiA+ICsKPiA+ICtzdGF0aWMgaXJxcmV0dXJuX3Qgdmhvc3RfbWRldl92aXJ0cXVldWVfY2Iodm9p
ZCAqcHJpdmF0ZSkKPiA+ICt7Cj4gPiArCXN0cnVjdCB2aG9zdF92aXJ0cXVldWUgKnZxID0gcHJp
dmF0ZTsKPiA+ICsJc3RydWN0IGV2ZW50ZmRfY3R4ICpjYWxsX2N0eCA9IHZxLT5jYWxsX2N0eDsK
PiA+ICsKPiA+ICsJaWYgKGNhbGxfY3R4KQo+ID4gKwkJZXZlbnRmZF9zaWduYWwoY2FsbF9jdHgs
IDEpOwo+ID4gKwo+ID4gKwlyZXR1cm4gSVJRX0hBTkRMRUQ7Cj4gPiArfQo+ID4gKwo+ID4gK3N0
YXRpYyB2b2lkIHZob3N0X21kZXZfcmVzZXQoc3RydWN0IHZob3N0X21kZXYgKm0pCj4gPiArewo+
ID4gKwlzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYgPSBtLT5tZGV2Owo+ID4gKwljb25zdCBzdHJ1
Y3QgdmlydGlvX21kZXZfZGV2aWNlX29wcyAqb3BzID0gbWRldl9nZXRfdmhvc3Rfb3BzKG1kZXYp
Owo+ID4gKwo+ID4gKwlvcHMtPnNldF9zdGF0dXMobWRldiwgMCk7Cj4gPiArfQo+ID4gKwo+ID4g
K3N0YXRpYyBsb25nIHZob3N0X21kZXZfZ2V0X2RldmljZV9pZChzdHJ1Y3Qgdmhvc3RfbWRldiAq
bSwgdTggX191c2VyICphcmdwKQo+ID4gK3sKPiA+ICsJc3RydWN0IG1kZXZfZGV2aWNlICptZGV2
ID0gbS0+bWRldjsKPiA+ICsJY29uc3Qgc3RydWN0IHZpcnRpb19tZGV2X2RldmljZV9vcHMgKm9w
cyA9IG1kZXZfZ2V0X3Zob3N0X29wcyhtZGV2KTsKPiA+ICsJdTMyIGRldmljZV9pZDsKPiA+ICsK
PiA+ICsJZGV2aWNlX2lkID0gb3BzLT5nZXRfZGV2aWNlX2lkKG1kZXYpOwo+ID4gKwo+ID4gKwlp
ZiAoY29weV90b191c2VyKGFyZ3AsICZkZXZpY2VfaWQsIHNpemVvZihkZXZpY2VfaWQpKSkKPiA+
ICsJCXJldHVybiAtRUZBVUxUOwo+ID4gKwo+ID4gKwlyZXR1cm4gMDsKPiA+ICt9Cj4gCj4gCj4g
SSBiZWxpZXZlIHdlIG5lZWQgZ2V0X3ZlbmRvcl9pZCgpIGFzIHdlbGw/CgpDdXJyZW50bHksIHRo
ZXJlIGlzIG5vIG9mZmljaWFsIHdheSBmb3IgdmVuZG9ycyB0byBkbyB2ZW5kb3IKc3BlY2lmaWMg
ZXh0ZW5zaW9ucyBpbiB2aG9zdC1tZGV2IHlldC4gSXQgbWlnaHQgYmUgYmV0dGVyIHRvCmFkZCB0
aGlzIGlvY3RsIHdoZW4gd2Ugc3VwcG9ydCB0aGlzLgoKPiAKPiAKPiA+ICsKPiA+ICtzdGF0aWMg
bG9uZyB2aG9zdF9tZGV2X2dldF9zdGF0dXMoc3RydWN0IHZob3N0X21kZXYgKm0sIHU4IF9fdXNl
ciAqc3RhdHVzcCkKPiA+ICt7Cj4gPiArCXN0cnVjdCBtZGV2X2RldmljZSAqbWRldiA9IG0tPm1k
ZXY7Cj4gPiArCWNvbnN0IHN0cnVjdCB2aXJ0aW9fbWRldl9kZXZpY2Vfb3BzICpvcHMgPSBtZGV2
X2dldF92aG9zdF9vcHMobWRldik7Cj4gPiArCXU4IHN0YXR1czsKPiA+ICsKPiA+ICsJc3RhdHVz
ID0gb3BzLT5nZXRfc3RhdHVzKG1kZXYpOwo+ID4gKwo+ID4gKwlpZiAoY29weV90b191c2VyKHN0
YXR1c3AsICZzdGF0dXMsIHNpemVvZihzdGF0dXMpKSkKPiA+ICsJCXJldHVybiAtRUZBVUxUOwo+
ID4gKwo+ID4gKwlyZXR1cm4gMDsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIGxvbmcgdmhvc3Rf
bWRldl9zZXRfc3RhdHVzKHN0cnVjdCB2aG9zdF9tZGV2ICptLCB1OCBfX3VzZXIgKnN0YXR1c3Ap
Cj4gPiArewo+ID4gKwlzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYgPSBtLT5tZGV2Owo+ID4gKwlj
b25zdCBzdHJ1Y3QgdmlydGlvX21kZXZfZGV2aWNlX29wcyAqb3BzID0gbWRldl9nZXRfdmhvc3Rf
b3BzKG1kZXYpOwo+ID4gKwl1OCBzdGF0dXM7Cj4gPiArCj4gPiArCWlmIChjb3B5X2Zyb21fdXNl
cigmc3RhdHVzLCBzdGF0dXNwLCBzaXplb2Yoc3RhdHVzKSkpCj4gPiArCQlyZXR1cm4gLUVGQVVM
VDsKPiA+ICsKPiA+ICsJLyoKPiA+ICsJICogVXNlcnNwYWNlIHNob3VsZG4ndCByZW1vdmUgc3Rh
dHVzIGJpdHMgdW5sZXNzIHJlc2V0IHRoZQo+ID4gKwkgKiBzdGF0dXMgdG8gMC4KPiA+ICsJICov
Cj4gPiArCWlmIChzdGF0dXMgIT0gMCAmJiAob3BzLT5nZXRfc3RhdHVzKG1kZXYpICYgfnN0YXR1
cykgIT0gMCkKPiA+ICsJCXJldHVybiAtRUlOVkFMOwo+ID4gKwo+ID4gKwlvcHMtPnNldF9zdGF0
dXMobWRldiwgc3RhdHVzKTsKPiA+ICsKPiA+ICsJcmV0dXJuIDA7Cj4gPiArfQo+ID4gKwo+ID4g
K3N0YXRpYyBpbnQgdmhvc3RfbWRldl9jb25maWdfdmFsaWRhdGUoc3RydWN0IHZob3N0X21kZXYg
Km0sCj4gPiArCQkJCSAgICAgIHN0cnVjdCB2aG9zdF9tZGV2X2NvbmZpZyAqYykKPiA+ICt7Cj4g
PiArCWxvbmcgc2l6ZSA9IDA7Cj4gPiArCj4gPiArCXN3aXRjaCAobS0+dmlydGlvX2lkKSB7Cj4g
PiArCWNhc2UgVklSVElPX0lEX05FVDoKPiA+ICsJCXNpemUgPSBzaXplb2Yoc3RydWN0IHZpcnRp
b19uZXRfY29uZmlnKTsKPiA+ICsJCWJyZWFrOwo+ID4gKwl9Cj4gPiArCj4gPiArCWlmIChjLT5s
ZW4gPT0gMCkKPiA+ICsJCXJldHVybiAtRUlOVkFMOwo+ID4gKwo+ID4gKwlpZiAoYy0+b2ZmID49
IHNpemUgfHwgYy0+bGVuID4gc2l6ZSB8fCBjLT5vZmYgKyBjLT5sZW4gPiBzaXplKQo+ID4gKwkJ
cmV0dXJuIC1FMkJJRzsKPiA+ICsKPiA+ICsJcmV0dXJuIDA7Cj4gPiArfQo+ID4gKwo+ID4gK3N0
YXRpYyBsb25nIHZob3N0X21kZXZfZ2V0X2NvbmZpZyhzdHJ1Y3Qgdmhvc3RfbWRldiAqbSwKPiA+
ICsJCQkJICBzdHJ1Y3Qgdmhvc3RfbWRldl9jb25maWcgX191c2VyICpjKQo+ID4gK3sKPiA+ICsJ
c3RydWN0IG1kZXZfZGV2aWNlICptZGV2ID0gbS0+bWRldjsKPiA+ICsJY29uc3Qgc3RydWN0IHZp
cnRpb19tZGV2X2RldmljZV9vcHMgKm9wcyA9IG1kZXZfZ2V0X3Zob3N0X29wcyhtZGV2KTsKPiA+
ICsJc3RydWN0IHZob3N0X21kZXZfY29uZmlnIGNvbmZpZzsKPiA+ICsJdW5zaWduZWQgbG9uZyBz
aXplID0gb2Zmc2V0b2Yoc3RydWN0IHZob3N0X21kZXZfY29uZmlnLCBidWYpOwo+ID4gKwl1OCAq
YnVmOwo+ID4gKwo+ID4gKwlpZiAoY29weV9mcm9tX3VzZXIoJmNvbmZpZywgYywgc2l6ZSkpCj4g
PiArCQlyZXR1cm4gLUVGQVVMVDsKPiA+ICsJaWYgKHZob3N0X21kZXZfY29uZmlnX3ZhbGlkYXRl
KG0sICZjb25maWcpKQo+ID4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4gCj4gCj4gSSB0aGluayBpdCdz
IGJldHRlciB0byBsZXQgdGhlIHBhcmVudCB0byBkbyBzdWNoIHZhbGlkYXRpb24uIEVzcGVjaWFs
bHkKPiBjb25zaWRlciB0aGF0IHRoZSBzaXplIG9mIGNvbmZpZyBtYXkgZGVwZW5kIG9uIGZlYXR1
cmUgKGUuZyBNUSkuCgpBYm92ZSBjaGVjayBpcyBqdXN0IGEgYmFzaWMgc2FuaXR5IGNoZWNrIHRv
IG1ha2Ugc3VyZQp0aGF0IGUuZy4gd2Ugd29uJ3QgYWxsb2MgYSBodWdlIGFtb3VudCBvZiBtZW1v
cnkuCgo+IAo+IAo+ID4gKwlidWYgPSBrdnphbGxvYyhjb25maWcubGVuLCBHRlBfS0VSTkVMKTsK
PiA+ICsJaWYgKCFidWYpCj4gPiArCQlyZXR1cm4gLUVOT01FTTsKPiA+ICsKPiA+ICsJb3BzLT5n
ZXRfY29uZmlnKG1kZXYsIGNvbmZpZy5vZmYsIGJ1ZiwgY29uZmlnLmxlbik7Cj4gPiArCj4gPiAr
CWlmIChjb3B5X3RvX3VzZXIoYy0+YnVmLCBidWYsIGNvbmZpZy5sZW4pKSB7Cj4gPiArCQlrdmZy
ZWUoYnVmKTsKPiA+ICsJCXJldHVybiAtRUZBVUxUOwo+ID4gKwl9Cj4gPiArCj4gPiArCWt2ZnJl
ZShidWYpOwo+ID4gKwlyZXR1cm4gMDsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIGxvbmcgdmhv
c3RfbWRldl9zZXRfY29uZmlnKHN0cnVjdCB2aG9zdF9tZGV2ICptLAo+ID4gKwkJCQkgIHN0cnVj
dCB2aG9zdF9tZGV2X2NvbmZpZyBfX3VzZXIgKmMpCj4gPiArewo+ID4gKwlzdHJ1Y3QgbWRldl9k
ZXZpY2UgKm1kZXYgPSBtLT5tZGV2Owo+ID4gKwljb25zdCBzdHJ1Y3QgdmlydGlvX21kZXZfZGV2
aWNlX29wcyAqb3BzID0gbWRldl9nZXRfdmhvc3Rfb3BzKG1kZXYpOwo+ID4gKwlzdHJ1Y3Qgdmhv
c3RfbWRldl9jb25maWcgY29uZmlnOwo+ID4gKwl1bnNpZ25lZCBsb25nIHNpemUgPSBvZmZzZXRv
ZihzdHJ1Y3Qgdmhvc3RfbWRldl9jb25maWcsIGJ1Zik7Cj4gPiArCXU4ICpidWY7Cj4gPiArCj4g
PiArCWlmIChjb3B5X2Zyb21fdXNlcigmY29uZmlnLCBjLCBzaXplKSkKPiA+ICsJCXJldHVybiAt
RUZBVUxUOwo+ID4gKwlpZiAodmhvc3RfbWRldl9jb25maWdfdmFsaWRhdGUobSwgJmNvbmZpZykp
Cj4gPiArCQlyZXR1cm4gLUVJTlZBTDsKPiA+ICsJYnVmID0ga3Z6YWxsb2MoY29uZmlnLmxlbiwg
R0ZQX0tFUk5FTCk7Cj4gPiArCWlmICghYnVmKQo+ID4gKwkJcmV0dXJuIC1FTk9NRU07Cj4gPiAr
Cj4gPiArCWlmIChjb3B5X2Zyb21fdXNlcihidWYsIGMtPmJ1ZiwgY29uZmlnLmxlbikpIHsKPiA+
ICsJCWt2ZnJlZShidWYpOwo+ID4gKwkJcmV0dXJuIC1FRkFVTFQ7Cj4gPiArCX0KPiA+ICsKPiA+
ICsJb3BzLT5zZXRfY29uZmlnKG1kZXYsIGNvbmZpZy5vZmYsIGJ1ZiwgY29uZmlnLmxlbik7Cj4g
PiArCj4gPiArCWt2ZnJlZShidWYpOwo+ID4gKwlyZXR1cm4gMDsKPiA+ICt9Cj4gPiArCj4gPiAr
c3RhdGljIGxvbmcgdmhvc3RfbWRldl9nZXRfZmVhdHVyZXMoc3RydWN0IHZob3N0X21kZXYgKm0s
IHU2NCBfX3VzZXIgKmZlYXR1cmVwKQo+ID4gK3sKPiA+ICsJc3RydWN0IG1kZXZfZGV2aWNlICpt
ZGV2ID0gbS0+bWRldjsKPiA+ICsJY29uc3Qgc3RydWN0IHZpcnRpb19tZGV2X2RldmljZV9vcHMg
Km9wcyA9IG1kZXZfZ2V0X3Zob3N0X29wcyhtZGV2KTsKPiA+ICsJdTY0IGZlYXR1cmVzOwo+ID4g
Kwo+ID4gKwlmZWF0dXJlcyA9IG9wcy0+Z2V0X2ZlYXR1cmVzKG1kZXYpOwo+ID4gKwlmZWF0dXJl
cyAmPSB2aG9zdF9tZGV2X2ZlYXR1cmVzW20tPnZpcnRpb19pZF07Cj4gPiArCj4gPiArCWlmIChj
b3B5X3RvX3VzZXIoZmVhdHVyZXAsICZmZWF0dXJlcywgc2l6ZW9mKGZlYXR1cmVzKSkpCj4gPiAr
CQlyZXR1cm4gLUVGQVVMVDsKPiA+ICsKPiA+ICsJcmV0dXJuIDA7Cj4gPiArfQo+ID4gKwo+ID4g
K3N0YXRpYyBsb25nIHZob3N0X21kZXZfc2V0X2ZlYXR1cmVzKHN0cnVjdCB2aG9zdF9tZGV2ICpt
LCB1NjQgX191c2VyICpmZWF0dXJlcCkKPiA+ICt7Cj4gPiArCXN0cnVjdCBtZGV2X2RldmljZSAq
bWRldiA9IG0tPm1kZXY7Cj4gPiArCWNvbnN0IHN0cnVjdCB2aXJ0aW9fbWRldl9kZXZpY2Vfb3Bz
ICpvcHMgPSBtZGV2X2dldF92aG9zdF9vcHMobWRldik7Cj4gPiArCXU2NCBmZWF0dXJlczsKPiA+
ICsKPiA+ICsJLyoKPiA+ICsJICogSXQncyBub3QgYWxsb3dlZCB0byBjaGFuZ2UgdGhlIGZlYXR1
cmVzIGFmdGVyIHRoZXkgaGF2ZQo+ID4gKwkgKiBiZWVuIG5lZ290aWF0ZWQuCj4gPiArCSAqLwo+
ID4gKwlpZiAob3BzLT5nZXRfc3RhdHVzKG1kZXYpICYgVklSVElPX0NPTkZJR19TX0ZFQVRVUkVT
X09LKQo+ID4gKwkJcmV0dXJuIC1FQlVTWTsKPiA+ICsKPiA+ICsJaWYgKGNvcHlfZnJvbV91c2Vy
KCZmZWF0dXJlcywgZmVhdHVyZXAsIHNpemVvZihmZWF0dXJlcykpKQo+ID4gKwkJcmV0dXJuIC1F
RkFVTFQ7Cj4gPiArCj4gPiArCWlmIChmZWF0dXJlcyAmIH52aG9zdF9tZGV2X2ZlYXR1cmVzW20t
PnZpcnRpb19pZF0pCj4gPiArCQlyZXR1cm4gLUVJTlZBTDsKPiA+ICsKPiA+ICsJaWYgKG9wcy0+
c2V0X2ZlYXR1cmVzKG1kZXYsIGZlYXR1cmVzKSkKPiA+ICsJCXJldHVybiAtRUlOVkFMOwo+ID4g
Kwo+ID4gKwlyZXR1cm4gMDsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIGxvbmcgdmhvc3RfbWRl
dl9nZXRfdnJpbmdfbnVtKHN0cnVjdCB2aG9zdF9tZGV2ICptLCB1MTYgX191c2VyICphcmdwKQo+
ID4gK3sKPiA+ICsJc3RydWN0IG1kZXZfZGV2aWNlICptZGV2ID0gbS0+bWRldjsKPiA+ICsJY29u
c3Qgc3RydWN0IHZpcnRpb19tZGV2X2RldmljZV9vcHMgKm9wcyA9IG1kZXZfZ2V0X3Zob3N0X29w
cyhtZGV2KTsKPiA+ICsJdTE2IG51bTsKPiA+ICsKPiA+ICsJbnVtID0gb3BzLT5nZXRfdnFfbnVt
X21heChtZGV2KTsKPiA+ICsKPiA+ICsJaWYgKGNvcHlfdG9fdXNlcihhcmdwLCAmbnVtLCBzaXpl
b2YobnVtKSkpCj4gPiArCQlyZXR1cm4gLUVGQVVMVDsKPiA+ICsKPiA+ICsJcmV0dXJuIDA7Cj4g
PiArfQo+ID4gKwo+ID4gK3N0YXRpYyBsb25nIHZob3N0X21kZXZfdnJpbmdfaW9jdGwoc3RydWN0
IHZob3N0X21kZXYgKm0sIHVuc2lnbmVkIGludCBjbWQsCj4gPiArCQkJCSAgIHZvaWQgX191c2Vy
ICphcmdwKQo+ID4gK3sKPiA+ICsJc3RydWN0IG1kZXZfZGV2aWNlICptZGV2ID0gbS0+bWRldjsK
PiA+ICsJY29uc3Qgc3RydWN0IHZpcnRpb19tZGV2X2RldmljZV9vcHMgKm9wcyA9IG1kZXZfZ2V0
X3Zob3N0X29wcyhtZGV2KTsKPiA+ICsJc3RydWN0IHZpcnRpb19tZGV2X2NhbGxiYWNrIGNiOwo+
ID4gKwlzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlICp2cTsKPiA+ICsJc3RydWN0IHZob3N0X3ZyaW5n
X3N0YXRlIHM7Cj4gPiArCXU4IHN0YXR1czsKPiA+ICsJdTMyIGlkeDsKPiA+ICsJbG9uZyByOwo+
ID4gKwo+ID4gKwlyID0gZ2V0X3VzZXIoaWR4LCAodTMyIF9fdXNlciAqKWFyZ3ApOwo+ID4gKwlp
ZiAociA8IDApCj4gPiArCQlyZXR1cm4gcjsKPiA+ICsJaWYgKGlkeCA+PSBtLT5udnFzKQo+ID4g
KwkJcmV0dXJuIC1FTk9CVUZTOwo+ID4gKwo+ID4gKwlzdGF0dXMgPSBvcHMtPmdldF9zdGF0dXMo
bWRldik7Cj4gPiArCj4gPiArCS8qCj4gPiArCSAqIEl0J3Mgbm90IGFsbG93ZWQgdG8gZGV0ZWN0
IGFuZCBwcm9ncmFtIHZxcyBiZWZvcmUKPiA+ICsJICogZmVhdHVyZXMgbmVnb3RpYXRpb24gb3Ig
YWZ0ZXIgZW5hYmxpbmcgZHJpdmVyLgo+ID4gKwkgKi8KPiA+ICsJaWYgKCEoc3RhdHVzICYgVklS
VElPX0NPTkZJR19TX0ZFQVRVUkVTX09LKSB8fAo+ID4gKwkgICAgKHN0YXR1cyAmIFZJUlRJT19D
T05GSUdfU19EUklWRVJfT0spKQo+ID4gKwkJcmV0dXJuIC1FQlVTWTsKPiA+ICsKPiA+ICsJdnEg
PSAmbS0+dnFzW2lkeF07Cj4gPiArCj4gPiArCWlmIChjbWQgPT0gVkhPU1RfTURFVl9TRVRfVlJJ
TkdfRU5BQkxFKSB7Cj4gPiArCQlpZiAoY29weV9mcm9tX3VzZXIoJnMsIGFyZ3AsIHNpemVvZihz
KSkpCj4gPiArCQkJcmV0dXJuIC1FRkFVTFQ7Cj4gPiArCQlvcHMtPnNldF92cV9yZWFkeShtZGV2
LCBpZHgsIHMubnVtKTsKPiA+ICsJCXJldHVybiAwOwo+ID4gKwl9Cj4gPiArCj4gPiArCS8qCj4g
PiArCSAqIEl0J3Mgbm90IGFsbG93ZWQgdG8gZGV0ZWN0IGFuZCBwcm9ncmFtIHZxcyB3aXRoCj4g
PiArCSAqIHZxcyBlbmFibGVkLgo+ID4gKwkgKi8KPiA+ICsJaWYgKG9wcy0+Z2V0X3ZxX3JlYWR5
KG1kZXYsIGlkeCkpCj4gPiArCQlyZXR1cm4gLUVCVVNZOwo+ID4gKwo+ID4gKwlpZiAoY21kID09
IFZIT1NUX0dFVF9WUklOR19CQVNFKQo+ID4gKwkJdnEtPmxhc3RfYXZhaWxfaWR4ID0gb3BzLT5n
ZXRfdnFfc3RhdGUobS0+bWRldiwgaWR4KTsKPiA+ICsKPiA+ICsJciA9IHZob3N0X3ZyaW5nX2lv
Y3RsKCZtLT5kZXYsIGNtZCwgYXJncCk7Cj4gPiArCWlmIChyKQo+ID4gKwkJcmV0dXJuIHI7Cj4g
PiArCj4gPiArCXN3aXRjaCAoY21kKSB7Cj4gPiArCWNhc2UgVkhPU1RfU0VUX1ZSSU5HX0FERFI6
Cj4gPiArCQkvKgo+ID4gKwkJICogSW4gdmhvc3QtbWRldiwgdGhlIHJpbmcgYWRkcmVzc2VzIHNl
dCBieSB1c2Vyc3BhY2Ugc2hvdWxkCj4gPiArCQkgKiBiZSB0aGUgRE1BIGFkZHJlc3NlcyB3aXRo
aW4gdGhlIFZGSU8gY29udGFpbmVyL2dyb3VwLgo+ID4gKwkJICovCj4gPiArCQlpZiAob3BzLT5z
ZXRfdnFfYWRkcmVzcyhtZGV2LCBpZHgsICh1NjQpdnEtPmRlc2MsCj4gPiArCQkJCQkodTY0KXZx
LT5hdmFpbCwgKHU2NCl2cS0+dXNlZCkpCj4gPiArCQkJciA9IC1FTk9ERVY7Cj4gCj4gCj4gTml0
OiBJdCBsb29rcyB0byBtZSB0aGF0IHdlIG5lZWQgZXhwb3NlIGFsaWdubWVudCBvZiB2cSB0byB1
c2Vyc3BhY2UKPiAoZ2V0X3ZxX2FsaWduKCkpLgoKR3Vlc3QgZHJpdmVycyBhcmUgdXNpbmcgKG1h
eWJlIGhhcmRjb2RlZCkgYWxpZ25tZW50cyBiYXNlZApvbiB0aGUgYWxpZ25tZW50IHJlcXVpcmVt
ZW50cyBkZWZpbmVkIGluIHRoZSBzcGVjLiBJdCBtaWdodApiZSBiZXR0ZXIgdG8gbGV0IGJhY2tl
bmRzIGZvbGxvdyB0aGUgc2FtZSBzdGFuZGFyZCBmb3IgdGhlCmNvbXBhdGliaWxpdHkuCgo+IAo+
IFRoYW5rcwo+IAo+IAo+ID4gKwkJYnJlYWs7Cj4gPiArCj4gPiArCWNhc2UgVkhPU1RfU0VUX1ZS
SU5HX0JBU0U6Cj4gPiArCQlpZiAob3BzLT5zZXRfdnFfc3RhdGUobWRldiwgaWR4LCB2cS0+bGFz
dF9hdmFpbF9pZHgpKQo+ID4gKwkJCXIgPSAtRU5PREVWOwo+ID4gKwkJYnJlYWs7Cj4gPiArCj4g
PiArCWNhc2UgVkhPU1RfU0VUX1ZSSU5HX0NBTEw6Cj4gPiArCQlpZiAodnEtPmNhbGxfY3R4KSB7
Cj4gPiArCQkJY2IuY2FsbGJhY2sgPSB2aG9zdF9tZGV2X3ZpcnRxdWV1ZV9jYjsKPiA+ICsJCQlj
Yi5wcml2YXRlID0gdnE7Cj4gPiArCQl9IGVsc2Ugewo+ID4gKwkJCWNiLmNhbGxiYWNrID0gTlVM
TDsKPiA+ICsJCQljYi5wcml2YXRlID0gTlVMTDsKPiA+ICsJCX0KPiA+ICsJCW9wcy0+c2V0X3Zx
X2NiKG1kZXYsIGlkeCwgJmNiKTsKPiA+ICsJCWJyZWFrOwo+ID4gKwo+ID4gKwljYXNlIFZIT1NU
X1NFVF9WUklOR19OVU06Cj4gPiArCQlvcHMtPnNldF92cV9udW0obWRldiwgaWR4LCB2cS0+bnVt
KTsKPiA+ICsJCWJyZWFrOwo+ID4gKwl9Cj4gPiArCj4gPiArCXJldHVybiByOwo+ID4gK30KPiA+
ICsKPiA+ICtzdGF0aWMgaW50IHZob3N0X21kZXZfb3Blbih2b2lkICpkZXZpY2VfZGF0YSkKPiA+
ICt7Cj4gPiArCXN0cnVjdCB2aG9zdF9tZGV2ICptID0gZGV2aWNlX2RhdGE7Cj4gPiArCXN0cnVj
dCB2aG9zdF9kZXYgKmRldjsKPiA+ICsJc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAqKnZxczsKPiA+
ICsJaW50IG52cXMsIGksIHI7Cj4gPiArCj4gPiArCWlmICghdHJ5X21vZHVsZV9nZXQoVEhJU19N
T0RVTEUpKQo+ID4gKwkJcmV0dXJuIC1FTk9ERVY7Cj4gPiArCj4gPiArCW11dGV4X2xvY2soJm0t
Pm11dGV4KTsKPiA+ICsKPiA+ICsJaWYgKG0tPm9wZW5lZCkgewo+ID4gKwkJciA9IC1FQlVTWTsK
PiA+ICsJCWdvdG8gZXJyOwo+ID4gKwl9Cj4gPiArCj4gPiArCW52cXMgPSBtLT5udnFzOwo+ID4g
Kwl2aG9zdF9tZGV2X3Jlc2V0KG0pOwo+ID4gKwo+ID4gKwl2cXMgPSBrbWFsbG9jX2FycmF5KG52
cXMsIHNpemVvZigqdnFzKSwgR0ZQX0tFUk5FTCk7Cj4gPiArCWlmICghdnFzKSB7Cj4gPiArCQly
ID0gLUVOT01FTTsKPiA+ICsJCWdvdG8gZXJyOwo+ID4gKwl9Cj4gPiArCj4gPiArCWRldiA9ICZt
LT5kZXY7Cj4gPiArCWZvciAoaSA9IDA7IGkgPCBudnFzOyBpKyspIHsKPiA+ICsJCXZxc1tpXSA9
ICZtLT52cXNbaV07Cj4gPiArCQl2cXNbaV0tPmhhbmRsZV9raWNrID0gaGFuZGxlX3ZxX2tpY2s7
Cj4gPiArCX0KPiA+ICsJdmhvc3RfZGV2X2luaXQoZGV2LCB2cXMsIG52cXMsIDAsIDAsIDApOwo+
ID4gKwltLT5vcGVuZWQgPSB0cnVlOwo+ID4gKwltdXRleF91bmxvY2soJm0tPm11dGV4KTsKPiA+
ICsKPiA+ICsJcmV0dXJuIDA7Cj4gPiArCj4gPiArZXJyOgo+ID4gKwltdXRleF91bmxvY2soJm0t
Pm11dGV4KTsKPiA+ICsJbW9kdWxlX3B1dChUSElTX01PRFVMRSk7Cj4gPiArCXJldHVybiByOwo+
ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgdm9pZCB2aG9zdF9tZGV2X3JlbGVhc2Uodm9pZCAqZGV2
aWNlX2RhdGEpCj4gPiArewo+ID4gKwlzdHJ1Y3Qgdmhvc3RfbWRldiAqbSA9IGRldmljZV9kYXRh
Owo+ID4gKwo+ID4gKwltdXRleF9sb2NrKCZtLT5tdXRleCk7Cj4gPiArCXZob3N0X21kZXZfcmVz
ZXQobSk7Cj4gPiArCXZob3N0X2Rldl9zdG9wKCZtLT5kZXYpOwo+ID4gKwl2aG9zdF9kZXZfY2xl
YW51cCgmbS0+ZGV2KTsKPiA+ICsKPiA+ICsJa2ZyZWUobS0+ZGV2LnZxcyk7Cj4gPiArCW0tPm9w
ZW5lZCA9IGZhbHNlOwo+ID4gKwltdXRleF91bmxvY2soJm0tPm11dGV4KTsKPiA+ICsJbW9kdWxl
X3B1dChUSElTX01PRFVMRSk7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyBsb25nIHZob3N0X21k
ZXZfdW5sb2NrZWRfaW9jdGwodm9pZCAqZGV2aWNlX2RhdGEsCj4gPiArCQkJCSAgICAgIHVuc2ln
bmVkIGludCBjbWQsIHVuc2lnbmVkIGxvbmcgYXJnKQo+ID4gK3sKPiA+ICsJc3RydWN0IHZob3N0
X21kZXYgKm0gPSBkZXZpY2VfZGF0YTsKPiA+ICsJdm9pZCBfX3VzZXIgKmFyZ3AgPSAodm9pZCBf
X3VzZXIgKilhcmc7Cj4gPiArCWxvbmcgcjsKPiA+ICsKPiA+ICsJbXV0ZXhfbG9jaygmbS0+bXV0
ZXgpOwo+ID4gKwo+ID4gKwlzd2l0Y2ggKGNtZCkgewo+ID4gKwljYXNlIFZIT1NUX01ERVZfR0VU
X0RFVklDRV9JRDoKPiA+ICsJCXIgPSB2aG9zdF9tZGV2X2dldF9kZXZpY2VfaWQobSwgYXJncCk7
Cj4gPiArCQlicmVhazsKPiA+ICsJY2FzZSBWSE9TVF9NREVWX0dFVF9TVEFUVVM6Cj4gPiArCQly
ID0gdmhvc3RfbWRldl9nZXRfc3RhdHVzKG0sIGFyZ3ApOwo+ID4gKwkJYnJlYWs7Cj4gPiArCWNh
c2UgVkhPU1RfTURFVl9TRVRfU1RBVFVTOgo+ID4gKwkJciA9IHZob3N0X21kZXZfc2V0X3N0YXR1
cyhtLCBhcmdwKTsKPiA+ICsJCWJyZWFrOwo+ID4gKwljYXNlIFZIT1NUX01ERVZfR0VUX0NPTkZJ
RzoKPiA+ICsJCXIgPSB2aG9zdF9tZGV2X2dldF9jb25maWcobSwgYXJncCk7Cj4gPiArCQlicmVh
azsKPiA+ICsJY2FzZSBWSE9TVF9NREVWX1NFVF9DT05GSUc6Cj4gPiArCQlyID0gdmhvc3RfbWRl
dl9zZXRfY29uZmlnKG0sIGFyZ3ApOwo+ID4gKwkJYnJlYWs7Cj4gPiArCWNhc2UgVkhPU1RfR0VU
X0ZFQVRVUkVTOgo+ID4gKwkJciA9IHZob3N0X21kZXZfZ2V0X2ZlYXR1cmVzKG0sIGFyZ3ApOwo+
ID4gKwkJYnJlYWs7Cj4gPiArCWNhc2UgVkhPU1RfU0VUX0ZFQVRVUkVTOgo+ID4gKwkJciA9IHZo
b3N0X21kZXZfc2V0X2ZlYXR1cmVzKG0sIGFyZ3ApOwo+ID4gKwkJYnJlYWs7Cj4gPiArCWNhc2Ug
VkhPU1RfTURFVl9HRVRfVlJJTkdfTlVNOgo+ID4gKwkJciA9IHZob3N0X21kZXZfZ2V0X3ZyaW5n
X251bShtLCBhcmdwKTsKPiA+ICsJCWJyZWFrOwo+ID4gKwlkZWZhdWx0Ogo+ID4gKwkJLyoKPiA+
ICsJCSAqIFZIT1NUX1NFVF9NRU1fVEFCTEUsIFZIT1NUX1NFVF9MT0dfQkFTRSwgYW5kCj4gPiAr
CQkgKiBWSE9TVF9TRVRfTE9HX0ZEIGFyZSBub3QgdXNlZCB5ZXQuCj4gPiArCQkgKi8KPiA+ICsJ
CXIgPSB2aG9zdF9kZXZfaW9jdGwoJm0tPmRldiwgY21kLCBhcmdwKTsKPiA+ICsJCWlmIChyID09
IC1FTk9JT0NUTENNRCkKPiA+ICsJCQlyID0gdmhvc3RfbWRldl92cmluZ19pb2N0bChtLCBjbWQs
IGFyZ3ApOwo+ID4gKwl9Cj4gPiArCj4gPiArCW11dGV4X3VubG9jaygmbS0+bXV0ZXgpOwo+ID4g
KwlyZXR1cm4gcjsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCB2ZmlvX2Rl
dmljZV9vcHMgdmZpb192aG9zdF9tZGV2X2Rldl9vcHMgPSB7Cj4gPiArCS5uYW1lCQk9ICJ2Zmlv
LXZob3N0LW1kZXYiLAo+ID4gKwkub3BlbgkJPSB2aG9zdF9tZGV2X29wZW4sCj4gPiArCS5yZWxl
YXNlCT0gdmhvc3RfbWRldl9yZWxlYXNlLAo+ID4gKwkuaW9jdGwJCT0gdmhvc3RfbWRldl91bmxv
Y2tlZF9pb2N0bCwKPiA+ICt9Owo+ID4gKwo+ID4gK3N0YXRpYyBpbnQgdmhvc3RfbWRldl9wcm9i
ZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gPiArewo+ID4gKwlzdHJ1Y3QgbWRldl9kZXZpY2UgKm1k
ZXYgPSBtZGV2X2Zyb21fZGV2KGRldik7Cj4gPiArCWNvbnN0IHN0cnVjdCB2aXJ0aW9fbWRldl9k
ZXZpY2Vfb3BzICpvcHMgPSBtZGV2X2dldF92aG9zdF9vcHMobWRldik7Cj4gPiArCXN0cnVjdCB2
aG9zdF9tZGV2ICptOwo+ID4gKwlpbnQgbnZxcywgcjsKPiA+ICsKPiA+ICsJLyogQ3VycmVudGx5
LCB3ZSBvbmx5IGFjY2VwdCB0aGUgbmV0d29yayBkZXZpY2VzLiAqLwo+ID4gKwlpZiAob3BzLT5n
ZXRfZGV2aWNlX2lkKG1kZXYpICE9IFZJUlRJT19JRF9ORVQpCj4gPiArCQlyZXR1cm4gLUVOT1RT
VVBQOwo+ID4gKwo+ID4gKwlpZiAob3BzLT5nZXRfbWRldl9mZWF0dXJlcyhtZGV2KSAhPSBWSVJU
SU9fTURFVl9GX1ZFUlNJT05fMSkKPiA+ICsJCXJldHVybiAtRU5PVFNVUFA7Cj4gPiArCj4gPiAr
CW0gPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKm0pLCBHRlBfS0VSTkVMIHwgX19HRlBfUkVU
UllfTUFZRkFJTCk7Cj4gPiArCWlmICghbSkKPiA+ICsJCXJldHVybiAtRU5PTUVNOwo+ID4gKwo+
ID4gKwludnFzID0gVkhPU1RfTURFVl9WUV9NQVg7Cj4gPiArCj4gPiArCW0tPnZxcyA9IGRldm1f
a21hbGxvY19hcnJheShkZXYsIG52cXMsIHNpemVvZihzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlKSwK
PiA+ICsJCQkJICAgIEdGUF9LRVJORUwpOwo+ID4gKwlpZiAoIW0tPnZxcykKPiA+ICsJCXJldHVy
biAtRU5PTUVNOwo+ID4gKwo+ID4gKwltdXRleF9pbml0KCZtLT5tdXRleCk7Cj4gPiArCj4gPiAr
CW0tPm1kZXYgPSBtZGV2Owo+ID4gKwltLT5udnFzID0gbnZxczsKPiA+ICsJbS0+dmlydGlvX2lk
ID0gb3BzLT5nZXRfZGV2aWNlX2lkKG1kZXYpOwo+ID4gKwo+ID4gKwlyID0gdmZpb19hZGRfZ3Jv
dXBfZGV2KGRldiwgJnZmaW9fdmhvc3RfbWRldl9kZXZfb3BzLCBtKTsKPiA+ICsJaWYgKHIpIHsK
PiA+ICsJCW11dGV4X2Rlc3Ryb3koJm0tPm11dGV4KTsKPiA+ICsJCXJldHVybiByOwo+ID4gKwl9
Cj4gPiArCj4gPiArCXJldHVybiAwOwo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgdm9pZCB2aG9z
dF9tZGV2X3JlbW92ZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gPiArewo+ID4gKwlzdHJ1Y3Qgdmhv
c3RfbWRldiAqbTsKPiA+ICsKPiA+ICsJbSA9IHZmaW9fZGVsX2dyb3VwX2RldihkZXYpOwo+ID4g
KwltdXRleF9kZXN0cm95KCZtLT5tdXRleCk7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyBjb25z
dCBzdHJ1Y3QgbWRldl9jbGFzc19pZCB2aG9zdF9tZGV2X21hdGNoW10gPSB7Cj4gPiArCXsgTURF
Vl9DTEFTU19JRF9WSE9TVCB9LAo+ID4gKwl7IDAgfSwKPiA+ICt9Owo+ID4gK01PRFVMRV9ERVZJ
Q0VfVEFCTEUobWRldiwgdmhvc3RfbWRldl9tYXRjaCk7Cj4gPiArCj4gPiArc3RhdGljIHN0cnVj
dCBtZGV2X2RyaXZlciB2aG9zdF9tZGV2X2RyaXZlciA9IHsKPiA+ICsJLm5hbWUJPSAidmhvc3Rf
bWRldiIsCj4gPiArCS5wcm9iZQk9IHZob3N0X21kZXZfcHJvYmUsCj4gPiArCS5yZW1vdmUJPSB2
aG9zdF9tZGV2X3JlbW92ZSwKPiA+ICsJLmlkX3RhYmxlID0gdmhvc3RfbWRldl9tYXRjaCwKPiA+
ICt9Owo+ID4gKwo+ID4gK3N0YXRpYyBpbnQgX19pbml0IHZob3N0X21kZXZfaW5pdCh2b2lkKQo+
ID4gK3sKPiA+ICsJcmV0dXJuIG1kZXZfcmVnaXN0ZXJfZHJpdmVyKCZ2aG9zdF9tZGV2X2RyaXZl
ciwgVEhJU19NT0RVTEUpOwo+ID4gK30KPiA+ICttb2R1bGVfaW5pdCh2aG9zdF9tZGV2X2luaXQp
Owo+ID4gKwo+ID4gK3N0YXRpYyB2b2lkIF9fZXhpdCB2aG9zdF9tZGV2X2V4aXQodm9pZCkKPiA+
ICt7Cj4gPiArCW1kZXZfdW5yZWdpc3Rlcl9kcml2ZXIoJnZob3N0X21kZXZfZHJpdmVyKTsKPiA+
ICt9Cj4gPiArbW9kdWxlX2V4aXQodmhvc3RfbWRldl9leGl0KTsKPiA+ICsKPiA+ICtNT0RVTEVf
VkVSU0lPTigiMC4wLjEiKTsKPiA+ICtNT0RVTEVfTElDRU5TRSgiR1BMIHYyIik7Cj4gPiArTU9E
VUxFX0FVVEhPUigiSW50ZWwgQ29ycG9yYXRpb24iKTsKPiA+ICtNT0RVTEVfREVTQ1JJUFRJT04o
Ik1lZGlhdGVkIGRldmljZSBiYXNlZCBhY2NlbGVyYXRvciBmb3IgdmlydGlvIik7Cj4gPiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tZGV2LmggYi9pbmNsdWRlL2xpbnV4L21kZXYuaAo+ID4g
aW5kZXggOWI2OWIwYmJlYmZkLi4zZTFlMDM5MjYzNTUgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRl
L2xpbnV4L21kZXYuaAo+ID4gKysrIGIvaW5jbHVkZS9saW51eC9tZGV2LmgKPiA+IEBAIC0xMTcs
NiArMTE3LDEwIEBAIHZvaWQgbWRldl9zZXRfdmlydGlvX29wcyhzdHJ1Y3QgbWRldl9kZXZpY2Ug
Km1kZXYsCj4gPiAgCQkJIGNvbnN0IHN0cnVjdCB2aXJ0aW9fbWRldl9kZXZpY2Vfb3BzICp2aXJ0
aW9fb3BzKTsKPiA+ICBjb25zdCBzdHJ1Y3QgdmlydGlvX21kZXZfZGV2aWNlX29wcyAqCj4gPiAg
bWRldl9nZXRfdmlydGlvX29wcyhzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYpOwo+ID4gK3ZvaWQg
bWRldl9zZXRfdmhvc3Rfb3BzKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldiwKPiA+ICsJCQljb25z
dCBzdHJ1Y3QgdmlydGlvX21kZXZfZGV2aWNlX29wcyAqdmhvc3Rfb3BzKTsKPiA+ICtjb25zdCBz
dHJ1Y3QgdmlydGlvX21kZXZfZGV2aWNlX29wcyAqCj4gPiArbWRldl9nZXRfdmhvc3Rfb3BzKHN0
cnVjdCBtZGV2X2RldmljZSAqbWRldik7Cj4gPiAgCj4gPiAgZXh0ZXJuIHN0cnVjdCBidXNfdHlw
ZSBtZGV2X2J1c190eXBlOwo+ID4gIAo+ID4gQEAgLTEzMyw2ICsxMzcsNyBAQCBzdHJ1Y3QgbWRl
dl9kZXZpY2UgKm1kZXZfZnJvbV9kZXYoc3RydWN0IGRldmljZSAqZGV2KTsKPiA+ICBlbnVtIHsK
PiA+ICAJTURFVl9DTEFTU19JRF9WRklPID0gMSwKPiA+ICAJTURFVl9DTEFTU19JRF9WSVJUSU8g
PSAyLAo+ID4gKwlNREVWX0NMQVNTX0lEX1ZIT1NUID0gMywKPiA+ICAJLyogTmV3IGVudHJpZXMg
bXVzdCBiZSBhZGRlZCBoZXJlICovCj4gPiAgfTsKPiA+ICAKPiA+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL3VhcGkvbGludXgvdmhvc3QuaCBiL2luY2x1ZGUvdWFwaS9saW51eC92aG9zdC5oCj4gPiBp
bmRleCA0MGQwMjhlZWQ2NDUuLjA2MWEyODI0YTFiMyAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUv
dWFwaS9saW51eC92aG9zdC5oCj4gPiArKysgYi9pbmNsdWRlL3VhcGkvbGludXgvdmhvc3QuaAo+
ID4gQEAgLTExNiw0ICsxMTYsMjIgQEAKPiA+ICAjZGVmaW5lIFZIT1NUX1ZTT0NLX1NFVF9HVUVT
VF9DSUQJX0lPVyhWSE9TVF9WSVJUSU8sIDB4NjAsIF9fdTY0KQo+ID4gICNkZWZpbmUgVkhPU1Rf
VlNPQ0tfU0VUX1JVTk5JTkcJCV9JT1coVkhPU1RfVklSVElPLCAweDYxLCBpbnQpCj4gPiAgCj4g
PiArLyogVkhPU1RfTURFViBzcGVjaWZpYyBkZWZpbmVzICovCj4gPiArCj4gPiArLyogR2V0IHRo
ZSBkZXZpY2UgaWQuIFRoZSBkZXZpY2UgaWRzIGZvbGxvdyB0aGUgc2FtZSBkZWZpbml0aW9uIG9m
Cj4gPiArICogdGhlIGRldmljZSBpZCBkZWZpbmVkIGluIHZpcnRpby1zcGVjLiAqLwo+ID4gKyNk
ZWZpbmUgVkhPU1RfTURFVl9HRVRfREVWSUNFX0lECV9JT1IoVkhPU1RfVklSVElPLCAweDcwLCBf
X3UzMikKPiA+ICsvKiBHZXQgYW5kIHNldCB0aGUgc3RhdHVzLiBUaGUgc3RhdHVzIGJpdHMgZm9s
bG93IHRoZSBzYW1lIGRlZmluaXRpb24KPiA+ICsgKiBvZiB0aGUgZGV2aWNlIHN0YXR1cyBkZWZp
bmVkIGluIHZpcnRpby1zcGVjLiAqLwo+ID4gKyNkZWZpbmUgVkhPU1RfTURFVl9HRVRfU1RBVFVT
CQlfSU9SKFZIT1NUX1ZJUlRJTywgMHg3MSwgX191OCkKPiA+ICsjZGVmaW5lIFZIT1NUX01ERVZf
U0VUX1NUQVRVUwkJX0lPVyhWSE9TVF9WSVJUSU8sIDB4NzIsIF9fdTgpCj4gPiArLyogR2V0IGFu
ZCBzZXQgdGhlIGRldmljZSBjb25maWcuIFRoZSBkZXZpY2UgY29uZmlnIGZvbGxvd3MgdGhlIHNh
bWUKPiA+ICsgKiBkZWZpbml0aW9uIG9mIHRoZSBkZXZpY2UgY29uZmlnIGRlZmluZWQgaW4gdmly
dGlvLXNwZWMuICovCj4gPiArI2RlZmluZSBWSE9TVF9NREVWX0dFVF9DT05GSUcJCV9JT1IoVkhP
U1RfVklSVElPLCAweDczLCBzdHJ1Y3Qgdmhvc3RfbWRldl9jb25maWcpCj4gPiArI2RlZmluZSBW
SE9TVF9NREVWX1NFVF9DT05GSUcJCV9JT1coVkhPU1RfVklSVElPLCAweDc0LCBzdHJ1Y3Qgdmhv
c3RfbWRldl9jb25maWcpCj4gPiArLyogRW5hYmxlL2Rpc2FibGUgdGhlIHJpbmcuICovCj4gPiAr
I2RlZmluZSBWSE9TVF9NREVWX1NFVF9WUklOR19FTkFCTEUJX0lPVyhWSE9TVF9WSVJUSU8sIDB4
NzUsIHN0cnVjdCB2aG9zdF92cmluZ19zdGF0ZSkKPiA+ICsvKiBHZXQgdGhlIG1heCByaW5nIHNp
emUuICovCj4gPiArI2RlZmluZSBWSE9TVF9NREVWX0dFVF9WUklOR19OVU0JX0lPUihWSE9TVF9W
SVJUSU8sIDB4NzYsIF9fdTE2KQo+ID4gKwo+ID4gICNlbmRpZgo+ID4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvdWFwaS9saW51eC92aG9zdF90eXBlcy5oIGIvaW5jbHVkZS91YXBpL2xpbnV4L3Zob3N0
X3R5cGVzLmgKPiA+IGluZGV4IGM5MDcyOTBmZjA2NS4uN2IxMDVkMGIyZmI5IDEwMDY0NAo+ID4g
LS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L3Zob3N0X3R5cGVzLmgKPiA+ICsrKyBiL2luY2x1ZGUv
dWFwaS9saW51eC92aG9zdF90eXBlcy5oCj4gPiBAQCAtMTE5LDYgKzExOSwxNCBAQCBzdHJ1Y3Qg
dmhvc3Rfc2NzaV90YXJnZXQgewo+ID4gIAl1bnNpZ25lZCBzaG9ydCByZXNlcnZlZDsKPiA+ICB9
Owo+ID4gIAo+ID4gKy8qIFZIT1NUX01ERVYgc3BlY2lmaWMgZGVmaW5pdGlvbnMgKi8KPiA+ICsK
PiA+ICtzdHJ1Y3Qgdmhvc3RfbWRldl9jb25maWcgewo+ID4gKwlfX3UzMiBvZmY7Cj4gPiArCV9f
dTMyIGxlbjsKPiA+ICsJX191OCBidWZbMF07Cj4gPiArfTsKPiA+ICsKPiA+ICAvKiBGZWF0dXJl
IGJpdHMgKi8KPiA+ICAvKiBMb2cgYWxsIHdyaXRlIGRlc2NyaXB0b3JzLiBDYW4gYmUgY2hhbmdl
ZCB3aGlsZSBkZXZpY2UgaXMgYWN0aXZlLiAqLwo+ID4gICNkZWZpbmUgVkhPU1RfRl9MT0dfQUxM
IDI2Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZp
cnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3Vu
ZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0
aW5mby92aXJ0dWFsaXphdGlvbg==
