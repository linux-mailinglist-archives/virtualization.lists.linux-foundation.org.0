Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C8DA5F00
	for <lists.virtualization@lfdr.de>; Tue,  3 Sep 2019 03:58:41 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0D462BE7;
	Tue,  3 Sep 2019 01:58:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3D534A55
	for <virtualization@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 01:58:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5A1E4712
	for <virtualization@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 01:58:32 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Sep 2019 18:58:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,461,1559545200"; d="scan'208";a="181988659"
Received: from dpdk-virtio-tbie-2.sh.intel.com (HELO ___) ([10.67.104.71])
	by fmsmga008.fm.intel.com with ESMTP; 02 Sep 2019 18:58:29 -0700
Date: Tue, 3 Sep 2019 09:56:02 +0800
From: Tiwei Bie <tiwei.bie@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [RFC v3] vhost: introduce mdev based hardware vhost backend
Message-ID: <20190903015602.GA11404@___>
References: <20190828053712.26106-1-tiwei.bie@intel.com>
	<b91820c4-2fe2-55ee-5089-5f7c94322521@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b91820c4-2fe2-55ee-5089-5f7c94322521@redhat.com>
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

T24gTW9uLCBTZXAgMDIsIDIwMTkgYXQgMTI6MTU6MDVQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiBPbiAyMDE5LzgvMjgg5LiL5Y2IMTozNywgVGl3ZWkgQmllIHdyb3RlOgo+ID4gRGV0YWls
cyBhYm91dCB0aGlzIGNhbiBiZSBmb3VuZCBoZXJlOgo+ID4gCj4gPiBodHRwczovL2x3bi5uZXQv
QXJ0aWNsZXMvNzUwNzcwLwo+ID4gCj4gPiBXaGF0J3MgbmV3IGluIHRoaXMgdmVyc2lvbgo+ID4g
PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiA+IAo+ID4gVGhlcmUgYXJlIHRocmVlIGNob2lj
ZXMgYmFzZWQgb24gdGhlIGRpc2N1c3Npb24gWzFdIGluIFJGQyB2MjoKPiA+IAo+ID4gPiAjMS4g
V2UgZXhwb3NlIGEgVkZJTyBkZXZpY2UsIHNvIHdlIGNhbiByZXVzZSB0aGUgVkZJTyBjb250YWlu
ZXIvZ3JvdXAKPiA+ID4gICAgICBiYXNlZCBETUEgQVBJIGFuZCBwb3RlbnRpYWxseSByZXVzZSBh
IGxvdCBvZiBWRklPIGNvZGUgaW4gUUVNVS4KPiA+ID4gCj4gPiA+ICAgICAgQnV0IGluIHRoaXMg
Y2FzZSwgd2UgaGF2ZSB0d28gY2hvaWNlcyBmb3IgdGhlIFZGSU8gZGV2aWNlIGludGVyZmFjZQo+
ID4gPiAgICAgIChpLmUuIHRoZSBpbnRlcmZhY2Ugb24gdG9wIG9mIFZGSU8gZGV2aWNlIGZkKToK
PiA+ID4gCj4gPiA+ICAgICAgQSkgd2UgbWF5IGludmVudCBhIG5ldyB2aG9zdCBwcm90b2NvbCAo
YXMgZGVtb25zdHJhdGVkIGJ5IHRoZSBjb2RlCj4gPiA+ICAgICAgICAgaW4gdGhpcyBSRkMpIG9u
IFZGSU8gZGV2aWNlIGZkIHRvIG1ha2UgaXQgd29yayBpbiBWRklPJ3Mgd2F5LAo+ID4gPiAgICAg
ICAgIGkuZS4gcmVnaW9ucyBhbmQgaXJxcy4KPiA+ID4gCj4gPiA+ICAgICAgQikgT3IgYXMgeW91
IHByb3Bvc2VkLCBpbnN0ZWFkIG9mIGludmVudGluZyBhIG5ldyB2aG9zdCBwcm90b2NvbCwKPiA+
ID4gICAgICAgICB3ZSBjYW4gcmV1c2UgbW9zdCBleGlzdGluZyB2aG9zdCBpb2N0bHMgb24gdGhl
IFZGSU8gZGV2aWNlIGZkCj4gPiA+ICAgICAgICAgZGlyZWN0bHkuIFRoZXJlIHNob3VsZCBiZSBu
byBjb25mbGljdHMgYmV0d2VlbiB0aGUgVkZJTyBpb2N0bHMKPiA+ID4gICAgICAgICAodHlwZSBp
cyAweDNCKSBhbmQgVkhPU1QgaW9jdGxzICh0eXBlIGlzIDB4QUYpIGN1cnJlbnRseS4KPiA+ID4g
Cj4gPiA+ICMyLiBJbnN0ZWFkIG9mIGV4cG9zaW5nIGEgVkZJTyBkZXZpY2UsIHdlIG1heSBleHBv
c2UgYSBWSE9TVCBkZXZpY2UuCj4gPiA+ICAgICAgQW5kIHdlIHdpbGwgaW50cm9kdWNlIGEgbmV3
IG1kZXYgZHJpdmVyIHZob3N0LW1kZXYgdG8gZG8gdGhpcy4KPiA+ID4gICAgICBJdCB3b3VsZCBi
ZSBuYXR1cmFsIHRvIHJldXNlIHRoZSBleGlzdGluZyBrZXJuZWwgdmhvc3QgaW50ZXJmYWNlCj4g
PiA+ICAgICAgKGlvY3Rscykgb24gaXQgYXMgbXVjaCBhcyBwb3NzaWJsZS4gQnV0IHdlIHdpbGwg
bmVlZCB0byBpbnZlbnQKPiA+ID4gICAgICBzb21lIEFQSXMgZm9yIERNQSBwcm9ncmFtbWluZyAo
cmV1c2luZyBWSE9TVF9TRVRfTUVNX1RBQkxFIGlzIGEKPiA+ID4gICAgICBjaG9pY2UsIGJ1dCBp
dCdzIHRvbyBoZWF2eSBhbmQgZG9lc24ndCBzdXBwb3J0IHZJT01NVSBieSBpdHNlbGYpLgo+ID4g
VGhpcyB2ZXJzaW9uIGlzIG1vcmUgbGlrZSBhIHF1aWNrIFBvQyB0byB0cnkgSmFzb24ncyBwcm9w
b3NhbCBvbgo+ID4gcmV1c2luZyB2aG9zdCBpb2N0bHMuIEFuZCB0aGUgc2Vjb25kIHdheSAoIzEv
QikgaW4gYWJvdmUgdGhyZWUKPiA+IGNob2ljZXMgd2FzIGNob3NlbiBpbiB0aGlzIHZlcnNpb24g
dG8gZGVtb25zdHJhdGUgdGhlIGlkZWEgcXVpY2tseS4KPiA+IAo+ID4gTm93IHRoZSB1c2Vyc3Bh
Y2UgQVBJIGxvb2tzIGxpa2UgdGhpczoKPiA+IAo+ID4gLSBWRklPJ3MgY29udGFpbmVyL2dyb3Vw
IGJhc2VkIElPTU1VIEFQSSBpcyB1c2VkIHRvIGRvIHRoZQo+ID4gICAgRE1BIHByb2dyYW1taW5n
Lgo+ID4gCj4gPiAtIFZob3N0J3MgZXhpc3RpbmcgaW9jdGxzIGFyZSB1c2VkIHRvIHNldHVwIHRo
ZSBkZXZpY2UuCj4gPiAKPiA+IEFuZCB0aGUgZGV2aWNlIHdpbGwgcmVwb3J0IGRldmljZV9hcGkg
YXMgInZmaW8tdmhvc3QiLgo+ID4gCj4gPiBOb3RlIHRoYXQsIHRoZXJlIGFyZSBkaXJ0eSBoYWNr
cyBpbiB0aGlzIHZlcnNpb24uIElmIHdlIGRlY2lkZSB0bwo+ID4gZ28gdGhpcyB3YXksIHNvbWUg
cmVmYWN0b3JpbmcgaW4gdmhvc3QuYy92aG9zdC5oIG1heSBiZSBuZWVkZWQuCj4gPiAKPiA+IFBT
LiBUaGUgZGlyZWN0IG1hcHBpbmcgb2YgdGhlIG5vdGlmeSByZWdpc3RlcnMgaXNuJ3QgaW1wbGVt
ZW50ZWQKPiA+ICAgICAgaW4gdGhpcyB2ZXJzaW9uLgo+ID4gCj4gPiBbMV0gaHR0cHM6Ly9sa21s
Lm9yZy9sa21sLzIwMTkvNy85LzEwMQo+IAo+IAo+IFRoYW5rcyBmb3IgdGhlIHBhdGNoLCBzZWUg
Y29tbWVudHMgaW5saW5lLgo+IAo+IAo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBUaXdlaSBCaWUg
PHRpd2VpLmJpZUBpbnRlbC5jb20+Cj4gPiAtLS0KPiA+ICAgZHJpdmVycy92aG9zdC9LY29uZmln
ICAgICAgfCAgIDkgKwo+ID4gICBkcml2ZXJzL3Zob3N0L01ha2VmaWxlICAgICB8ICAgMyArCj4g
PiAgIGRyaXZlcnMvdmhvc3QvbWRldi5jICAgICAgIHwgMzgyICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysKPiA+ICAgaW5jbHVkZS9saW51eC92aG9zdF9tZGV2LmggfCAgNTgg
KysrKysrCj4gPiAgIGluY2x1ZGUvdWFwaS9saW51eC92ZmlvLmggIHwgICAyICsKPiA+ICAgaW5j
bHVkZS91YXBpL2xpbnV4L3Zob3N0LmggfCAgIDggKwo+ID4gICA2IGZpbGVzIGNoYW5nZWQsIDQ2
MiBpbnNlcnRpb25zKCspCj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3Zob3N0L21k
ZXYuYwo+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC92aG9zdF9tZGV2LmgK
Wy4uLl0KPiA+ICsKPiA+ICsJCWJyZWFrOwo+ID4gKwl9Cj4gPiArCWNhc2UgVkZJT19ERVZJQ0Vf
R0VUX1JFR0lPTl9JTkZPOgo+ID4gKwljYXNlIFZGSU9fREVWSUNFX0dFVF9JUlFfSU5GTzoKPiA+
ICsJY2FzZSBWRklPX0RFVklDRV9TRVRfSVJRUzoKPiA+ICsJY2FzZSBWRklPX0RFVklDRV9SRVNF
VDoKPiA+ICsJCXJldCA9IC1FSU5WQUw7Cj4gPiArCQlicmVhazsKPiA+ICsKPiA+ICsJY2FzZSBW
SE9TVF9NREVWX1NFVF9TVEFURToKPiA+ICsJCXJldCA9IHZob3N0X3NldF9zdGF0ZSh2ZHBhLCBh
cmdwKTsKPiA+ICsJCWJyZWFrOwo+IAo+IAo+IFNvIHRoaXMgaXMgdXNlZCB0byBzdGFydCBvciBz
dG9wIHRoZSBkZXZpY2UuIFRoaXMgbWVhbnMgaWYgdXNlcnNwYWNlIHdhbnQgdG8KPiBkcml2ZSBh
IG5ldHdvcmsgZGV2aWNlLCB0aGUgQVBJIGlzIG5vdCAxMDAlIGNvbXBhdGlibGUuIEFueSBibG9j
a2VyIGZvcgo+IHRoaXM/IEUuZyBmb3IgU0VUX0JBQ0tFTkQsIHdlIGNhbiBwYXNzIGEgZmQgYW5k
IHRoZW4gaWRlbnRpZnkgdGhlIHR5cGUgb2YKPiBiYWNrZW5kLgoKVGhpcyBpcyBhIGxlZ2FjeSBm
cm9tIHRoZSBwcmV2aW91cyBSRkMgY29kZS4gSSBkaWRuJ3QgdHJ5IHRvCmdldCByaWQgb2YgaXQg
d2hpbGUgZ2V0dGluZyB0aGlzIFBPQyB0byB3b3JrLiBJIGNhbiB0cnkgdG8gbWFrZQp0aGUgdmhv
c3QgaW9jdGxzIGZ1bGx5IGNvbXBhdGlibGUgd2l0aCB0aGUgZXhpc3RpbmcgdXNlcnNwYWNlCmlm
IHBvc3NpYmxlLgoKPiAKPiBBbm90aGVyIHF1ZXN0aW9uIGlzLCBob3cgY2FuIHVzZXIga25vdyB0
aGUgdHlwZSBvZiBhIGRldmljZT8KCk1heWJlIHdlIGNhbiBpbnRyb2R1Y2UgYW4gYXR0cmlidXRl
IGluICRVVUlELyB0byB0ZWxsIHRoZSB0eXBlLgoKPiAKPiAKPiA+ICsJY2FzZSBWSE9TVF9HRVRf
RkVBVFVSRVM6Cj4gPiArCQlyZXQgPSB2aG9zdF9nZXRfZmVhdHVyZXModmRwYSwgYXJncCk7Cj4g
PiArCQlicmVhazsKPiA+ICsJY2FzZSBWSE9TVF9TRVRfRkVBVFVSRVM6Cj4gPiArCQlyZXQgPSB2
aG9zdF9zZXRfZmVhdHVyZXModmRwYSwgYXJncCk7Cj4gPiArCQlicmVhazsKPiA+ICsJY2FzZSBW
SE9TVF9HRVRfVlJJTkdfQkFTRToKPiA+ICsJCXJldCA9IHZob3N0X2dldF92cmluZ19iYXNlKHZk
cGEsIGFyZ3ApOwo+ID4gKwkJYnJlYWs7Cj4gPiArCWRlZmF1bHQ6Cj4gPiArCQlyZXQgPSB2aG9z
dF9kZXZfaW9jdGwoJnZkcGEtPmRldiwgY21kLCBhcmdwKTsKPiA+ICsJCWlmIChyZXQgPT0gLUVO
T0lPQ1RMQ01EKQo+ID4gKwkJCXJldCA9IHZob3N0X3ZyaW5nX2lvY3RsKCZ2ZHBhLT5kZXYsIGNt
ZCwgYXJncCk7Cj4gPiArCX0KPiA+ICsKPiA+ICsJcmV0dXJuIHJldDsKPiA+ICt9ClsuLi5dCj4g
PiArc3RydWN0IG1kZXZfZGV2aWNlOwo+ID4gK3N0cnVjdCB2aG9zdF9tZGV2Owo+ID4gKwo+ID4g
K3R5cGVkZWYgaW50ICgqdmhvc3RfbWRldl9zdGFydF9kZXZpY2VfdCkoc3RydWN0IHZob3N0X21k
ZXYgKnZkcGEpOwo+ID4gK3R5cGVkZWYgaW50ICgqdmhvc3RfbWRldl9zdG9wX2RldmljZV90KShz
dHJ1Y3Qgdmhvc3RfbWRldiAqdmRwYSk7Cj4gPiArdHlwZWRlZiBpbnQgKCp2aG9zdF9tZGV2X3Nl
dF9mZWF0dXJlc190KShzdHJ1Y3Qgdmhvc3RfbWRldiAqdmRwYSk7Cj4gPiArdHlwZWRlZiB2b2lk
ICgqdmhvc3RfbWRldl9ub3RpZnlfZGV2aWNlX3QpKHN0cnVjdCB2aG9zdF9tZGV2ICp2ZHBhLCBp
bnQgcXVldWVfaWQpOwo+ID4gK3R5cGVkZWYgdTY0ICgqdmhvc3RfbWRldl9nZXRfbm90aWZ5X2Fk
ZHJfdCkoc3RydWN0IHZob3N0X21kZXYgKnZkcGEsIGludCBxdWV1ZV9pZCk7Cj4gPiArdHlwZWRl
ZiB1MTYgKCp2aG9zdF9tZGV2X2dldF92cmluZ19iYXNlX3QpKHN0cnVjdCB2aG9zdF9tZGV2ICp2
ZHBhLCBpbnQgcXVldWVfaWQpOwo+ID4gK3R5cGVkZWYgdm9pZCAoKnZob3N0X21kZXZfZmVhdHVy
ZXNfY2hhbmdlZF90KShzdHJ1Y3Qgdmhvc3RfbWRldiAqdmRwYSk7Cj4gPiArCj4gPiArc3RydWN0
IHZob3N0X21kZXZfZGV2aWNlX29wcyB7Cj4gPiArCXZob3N0X21kZXZfc3RhcnRfZGV2aWNlX3QJ
c3RhcnQ7Cj4gPiArCXZob3N0X21kZXZfc3RvcF9kZXZpY2VfdAlzdG9wOwo+ID4gKwl2aG9zdF9t
ZGV2X25vdGlmeV9kZXZpY2VfdAlub3RpZnk7Cj4gPiArCXZob3N0X21kZXZfZ2V0X25vdGlmeV9h
ZGRyX3QJZ2V0X25vdGlmeV9hZGRyOwo+ID4gKwl2aG9zdF9tZGV2X2dldF92cmluZ19iYXNlX3QJ
Z2V0X3ZyaW5nX2Jhc2U7Cj4gPiArCXZob3N0X21kZXZfZmVhdHVyZXNfY2hhbmdlZF90CWZlYXR1
cmVzX2NoYW5nZWQ7Cj4gPiArfTsKPiAKPiAKPiBDb25zaWRlciB3ZSB3YW50IHRvIGltcGxlbWVu
dCBhIG5ldHdvcmsgZGV2aWNlLCB3aG8gaXMgZ29pbmcgdG8gaW1wbGVtZW50Cj4gdGhlIGRldmlj
ZSBjb25maWd1cmF0aW9uIHNwYWNlPyBJIGJlbGlldmUgaXQncyBub3QgZ29vZCB0byBpbnZlbnQg
YW5vdGhlcgo+IHNldCBvZiBBUEkgZm9yIGRvaW5nIHRoaXMuIFNvIEkgYmVsaWV2ZSB3ZSB3YW50
IHNvbWV0aGluZyBsaWtlCj4gcmVhZF9jb25maWcvd3JpdGVfY29uZmlnIGhlcmUuCj4gCj4gVGhl
biBJIGNhbWUgdXAgYW4gaWRlYToKPiAKPiAxKSBpbnRyb2R1Y2UgYSBuZXcgbWRldiBidXMgdHJh
bnNwb3J0LCBhbmQgYSBuZXcgbWRldiBkcml2ZXIgdmlydGlvX21kZXYKPiAyKSB2RFBBIChlaXRo
ZXIgc29mdHdhcmUgb3IgaGFyZHdhcmUpIGNhbiByZWdpc3RlciBhcyBhIGRldmljZSBvZiB2aXJ0
aW8KPiBtZGV2IGRldmljZQo+IDMpIHRoZW4gd2UgY2FuIHVzZSBrZXJuZWwgdmlydGlvIGRyaXZl
ciB0byBkcml2ZSB2RFBBIGRldmljZSBhbmQgdXRpbGl6ZQo+IGtlcm5lbCBuZXR3b3JraW5nL3N0
b3JhZ2Ugc3RhY2sKPiA0KSBmb3IgdXNlcnNwYWNlIGRyaXZlciBsaWtlIHZob3N0LW1kZXYsIGl0
IGNvdWxkIGJlIGJ1aWx0IG9mIHRvcCBvZiBtZGV2Cj4gdHJhbnNwb3J0Cj4gCj4gSGF2aW5nIGEg
ZnVsbCBuZXcgdHJhbnNwb3J0IGZvciB2aXJ0aW8sIHRoZSBhZHZhbnRhZ2VzIGFyZSBvYnZpb3Vz
Ogo+IAo+IDEpIEEgZ2VuZXJpYyBzb2x1dGlvbiBmb3IgYm90aCBrZXJuZWwgYW5kIHVzZXJzcGFj
ZSBkcml2ZXIgYW5kIHN1cHBvcnQKPiBjb25maWd1cmF0aW9uIHNwYWNlIGFjY2Vzcwo+IDIpIEZv
ciBrZXJuZWwgZHJpdmVyLCBleGlzdCBrZXJuZWwgbmV0d29ya2luZy9zdG9yYWdlIHN0YWNrIGNv
dWxkIGJlIHJldXNlZCwKPiBhbmQgc28gZGlkIGZhc3QgcGF0aCBpbXBsZW1lbnRhdGlvbiAoZS5n
IFhEUCwgaW9fdXJpbmcgZXRjKS4KPiAyKSBGb3IgdXNlcnNwYWNlIGRyaXZlciwgdGhlIGZ1bmN0
aW9uIG9mIHZpcnRpbyB0cmFuc3BvcnQgaXMgYSBzdXBlcnNldCBvZgo+IHZob3N0LCBhbnkgQVBJ
IGNvdWxkIGJlIGJ1aWx0IG9uIHRvcCBlYXNpbHkgKGUuZyB2aG9zdCBpb2N0bCkuCj4gCj4gV2hh
dCdzIHlvdXIgdGhvdWdodD8KClRoaXMgc291bmRzIGludGVyZXN0aW5nIHRvIG1lISA7KQoKQnV0
IEknbSBub3QgcXVpdGUgc3VyZSB3aGV0aGVyIGl0J3MgdGhlIGJlc3QgY2hvaWNlIHRvIGFic3Ry
YWN0CnZob3N0IGFjY2VsZXJhdG9ycyBhcyB2aXJ0aW8gZGV2aWNlIGluIHZEUEEuIFZpcnRpbyBk
ZXZpY2UgaXMKdGhlIGZyb250ZW5kIGRldmljZS4gVGhlcmUgYXJlIHNvbWUgYmFja2VuZCBmZWF0
dXJlcyBtaXNzaW5nIGluCnZpcnRpbyBjdXJyZW50bHkuIEUuZy4gdGhlcmUgaXMgbm8gd2F5IHRv
IHRlbGwgdGhlIHZpcnRpbyBkZXZpY2UKdG8gZG8gZGlydHkgcGFnZSBsb2dnaW5nLiBCZXNpZGVz
LCBlLmcuIHRoZSBjb250cm9sIHZxIGluIG5ldHdvcmsKY2FzZSBzZWVtcyBub3QgYSBxdWl0ZSBn
b29kIGludGVyZmFjZSBmb3IgYSBiYWNrZW5kIGRldmljZS4gSW4KdGhpcyBjYXNlLCB0aGUgdXNl
cnNwYWNlIHZpcnRpby1tZGV2IGRyaXZlciBpbiBRRU1VIHdpbGwgZG8gdGhlCkRNQSBtYXBwaW5n
IHRvIGFsbG93IGd1ZXN0IGRyaXZlciB0byBiZSBhYmxlIHRvIHVzZSBHUEEvSU9WQSB0bwphY2Nl
c3MgdGhlIFJ4L1R4IHF1ZXVlcyBvZiB0aGUgdmlydGlvLW1kZXYgZGV2aWNlIGRpcmVjdGx5LCBi
dXQKSSdtIHdvbmRlcmluZyB3aWxsIHRoaXMgdXNlcnNwYWNlIHZpcnRpby1tZGV2IGRyaXZlciBp
biBRRU1VIHVzZQpzaW1pbGFyIElPVkEgdG8gYWNjZXNzIHRoZSBzb2Z0d2FyZSBiYXNlZCBjb250
cm9sIHZxIG9mIHRoZSBzYW1lCnZpcnRpby1tZGV2IGRldmljZSBhdCB0aGUgc2FtZSB0aW1lPwoK
VGhhbmtzLApUaXdlaQoKPiAKPiBUaGFua3MKPiAKPiAKPiA+ICsKPiA+ICtzdHJ1Y3Qgdmhvc3Rf
bWRldiAqdmhvc3RfbWRldl9hbGxvYyhzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsCj4gPiArCQl2
b2lkICpwcml2YXRlLCBpbnQgbnZxcyk7Cj4gPiArdm9pZCB2aG9zdF9tZGV2X2ZyZWUoc3RydWN0
IHZob3N0X21kZXYgKnZkcGEpOwo+ID4gKwo+ID4gK3NzaXplX3Qgdmhvc3RfbWRldl9yZWFkKHN0
cnVjdCBtZGV2X2RldmljZSAqbWRldiwgY2hhciBfX3VzZXIgKmJ1ZiwKPiA+ICsJCXNpemVfdCBj
b3VudCwgbG9mZl90ICpwcG9zKTsKPiA+ICtzc2l6ZV90IHZob3N0X21kZXZfd3JpdGUoc3RydWN0
IG1kZXZfZGV2aWNlICptZGV2LCBjb25zdCBjaGFyIF9fdXNlciAqYnVmLAo+ID4gKwkJc2l6ZV90
IGNvdW50LCBsb2ZmX3QgKnBwb3MpOwo+ID4gK2xvbmcgdmhvc3RfbWRldl9pb2N0bChzdHJ1Y3Qg
bWRldl9kZXZpY2UgKm1kZXYsIHVuc2lnbmVkIGludCBjbWQsCj4gPiArCQl1bnNpZ25lZCBsb25n
IGFyZyk7Cj4gPiAraW50IHZob3N0X21kZXZfbW1hcChzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYs
IHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKTsKPiA+ICtpbnQgdmhvc3RfbWRldl9vcGVuKHN0
cnVjdCBtZGV2X2RldmljZSAqbWRldik7Cj4gPiArdm9pZCB2aG9zdF9tZGV2X2Nsb3NlKHN0cnVj
dCBtZGV2X2RldmljZSAqbWRldik7Cj4gPiArCj4gPiAraW50IHZob3N0X21kZXZfc2V0X2Rldmlj
ZV9vcHMoc3RydWN0IHZob3N0X21kZXYgKnZkcGEsCj4gPiArCQljb25zdCBzdHJ1Y3Qgdmhvc3Rf
bWRldl9kZXZpY2Vfb3BzICpvcHMpOwo+ID4gK2ludCB2aG9zdF9tZGV2X3NldF9mZWF0dXJlcyhz
dHJ1Y3Qgdmhvc3RfbWRldiAqdmRwYSwgdTY0IGZlYXR1cmVzKTsKPiA+ICtzdHJ1Y3QgZXZlbnRm
ZF9jdHggKnZob3N0X21kZXZfZ2V0X2NhbGxfY3R4KHN0cnVjdCB2aG9zdF9tZGV2ICp2ZHBhLAo+
ID4gKwkJaW50IHF1ZXVlX2lkKTsKPiA+ICtpbnQgdmhvc3RfbWRldl9nZXRfYWNrZWRfZmVhdHVy
ZXMoc3RydWN0IHZob3N0X21kZXYgKnZkcGEsIHU2NCAqZmVhdHVyZXMpOwo+ID4gK2ludCB2aG9z
dF9tZGV2X2dldF92cmluZ19udW0oc3RydWN0IHZob3N0X21kZXYgKnZkcGEsIGludCBxdWV1ZV9p
ZCwgdTE2ICpudW0pOwo+ID4gK2ludCB2aG9zdF9tZGV2X2dldF92cmluZ19iYXNlKHN0cnVjdCB2
aG9zdF9tZGV2ICp2ZHBhLCBpbnQgcXVldWVfaWQsIHUxNiAqYmFzZSk7Cj4gPiAraW50IHZob3N0
X21kZXZfZ2V0X3ZyaW5nX2FkZHIoc3RydWN0IHZob3N0X21kZXYgKnZkcGEsIGludCBxdWV1ZV9p
ZCwKPiA+ICsJCXN0cnVjdCB2aG9zdF92cmluZ19hZGRyICphZGRyKTsKPiA+ICtpbnQgdmhvc3Rf
bWRldl9nZXRfbG9nX2Jhc2Uoc3RydWN0IHZob3N0X21kZXYgKnZkcGEsIGludCBxdWV1ZV9pZCwK
PiA+ICsJCXZvaWQgKipsb2dfYmFzZSwgdTY0ICpsb2dfc2l6ZSk7Cj4gPiArc3RydWN0IG1kZXZf
ZGV2aWNlICp2aG9zdF9tZGV2X2dldF9tZGV2KHN0cnVjdCB2aG9zdF9tZGV2ICp2ZHBhKTsKPiA+
ICt2b2lkICp2aG9zdF9tZGV2X2dldF9wcml2YXRlKHN0cnVjdCB2aG9zdF9tZGV2ICp2ZHBhKTsK
PiA+ICsKPiA+ICsjZW5kaWYgLyogX1ZIT1NUX01ERVZfSCAqLwo+ID4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvdWFwaS9saW51eC92ZmlvLmggYi9pbmNsdWRlL3VhcGkvbGludXgvdmZpby5oCj4gPiBp
bmRleCA4ZjEwNzQ4ZGFjNzkuLjAzMDBkNjgzMWNjNSAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUv
dWFwaS9saW51eC92ZmlvLmgKPiA+ICsrKyBiL2luY2x1ZGUvdWFwaS9saW51eC92ZmlvLmgKPiA+
IEBAIC0yMDEsNiArMjAxLDcgQEAgc3RydWN0IHZmaW9fZGV2aWNlX2luZm8gewo+ID4gICAjZGVm
aW5lIFZGSU9fREVWSUNFX0ZMQUdTX0FNQkEgICgxIDw8IDMpCS8qIHZmaW8tYW1iYSBkZXZpY2Ug
Ki8KPiA+ICAgI2RlZmluZSBWRklPX0RFVklDRV9GTEFHU19DQ1cJKDEgPDwgNCkJLyogdmZpby1j
Y3cgZGV2aWNlICovCj4gPiAgICNkZWZpbmUgVkZJT19ERVZJQ0VfRkxBR1NfQVAJKDEgPDwgNSkJ
LyogdmZpby1hcCBkZXZpY2UgKi8KPiA+ICsjZGVmaW5lIFZGSU9fREVWSUNFX0ZMQUdTX1ZIT1NU
CSgxIDw8IDYpCS8qIHZmaW8tdmhvc3QgZGV2aWNlICovCj4gPiAgIAlfX3UzMgludW1fcmVnaW9u
czsJLyogTWF4IHJlZ2lvbiBpbmRleCArIDEgKi8KPiA+ICAgCV9fdTMyCW51bV9pcnFzOwkvKiBN
YXggSVJRIGluZGV4ICsgMSAqLwo+ID4gICB9Owo+ID4gQEAgLTIxNyw2ICsyMTgsNyBAQCBzdHJ1
Y3QgdmZpb19kZXZpY2VfaW5mbyB7Cj4gPiAgICNkZWZpbmUgVkZJT19ERVZJQ0VfQVBJX0FNQkFf
U1RSSU5HCQkidmZpby1hbWJhIgo+ID4gICAjZGVmaW5lIFZGSU9fREVWSUNFX0FQSV9DQ1dfU1RS
SU5HCQkidmZpby1jY3ciCj4gPiAgICNkZWZpbmUgVkZJT19ERVZJQ0VfQVBJX0FQX1NUUklORwkJ
InZmaW8tYXAiCj4gPiArI2RlZmluZSBWRklPX0RFVklDRV9BUElfVkhPU1RfU1RSSU5HCQkidmZp
by12aG9zdCIKPiA+ICAgLyoqCj4gPiAgICAqIFZGSU9fREVWSUNFX0dFVF9SRUdJT05fSU5GTyAt
IF9JT1dSKFZGSU9fVFlQRSwgVkZJT19CQVNFICsgOCwKPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L3VhcGkvbGludXgvdmhvc3QuaCBiL2luY2x1ZGUvdWFwaS9saW51eC92aG9zdC5oCj4gPiBpbmRl
eCA0MGQwMjhlZWQ2NDUuLjVhZmJjMmYwOGZhMyAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvdWFw
aS9saW51eC92aG9zdC5oCj4gPiArKysgYi9pbmNsdWRlL3VhcGkvbGludXgvdmhvc3QuaAo+ID4g
QEAgLTExNiw0ICsxMTYsMTIgQEAKPiA+ICAgI2RlZmluZSBWSE9TVF9WU09DS19TRVRfR1VFU1Rf
Q0lECV9JT1coVkhPU1RfVklSVElPLCAweDYwLCBfX3U2NCkKPiA+ICAgI2RlZmluZSBWSE9TVF9W
U09DS19TRVRfUlVOTklORwkJX0lPVyhWSE9TVF9WSVJUSU8sIDB4NjEsIGludCkKPiA+ICsvKiBW
SE9TVF9NREVWIHNwZWNpZmljIGRlZmluZXMgKi8KPiA+ICsKPiA+ICsjZGVmaW5lIFZIT1NUX01E
RVZfU0VUX1NUQVRFCV9JT1coVkhPU1RfVklSVElPLCAweDcwLCBfX3U2NCkKPiA+ICsKPiA+ICsj
ZGVmaW5lIFZIT1NUX01ERVZfU19TVE9QUEVECTAKPiA+ICsjZGVmaW5lIFZIT1NUX01ERVZfU19S
VU5OSU5HCTEKPiA+ICsjZGVmaW5lIFZIT1NUX01ERVZfU19NQVgJMgo+ID4gKwo+ID4gICAjZW5k
aWYKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVh
bGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRp
b24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3ZpcnR1YWxpemF0aW9u
