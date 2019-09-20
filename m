Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2029BB89F8
	for <lists.virtualization@lfdr.de>; Fri, 20 Sep 2019 06:24:37 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7D736AB9;
	Fri, 20 Sep 2019 04:24:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C412B41C
	for <virtualization@lists.linux-foundation.org>;
	Fri, 20 Sep 2019 04:24:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4A150711
	for <virtualization@lists.linux-foundation.org>;
	Fri, 20 Sep 2019 04:24:26 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Sep 2019 21:24:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,527,1559545200"; d="scan'208";a="199622970"
Received: from dpdk-virtio-tbie-2.sh.intel.com (HELO ___) ([10.67.104.71])
	by orsmga002.jf.intel.com with ESMTP; 19 Sep 2019 21:24:22 -0700
Date: Fri, 20 Sep 2019 12:21:38 +0800
From: Tiwei Bie <tiwei.bie@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [RFC v4 3/3] vhost: introduce mdev based hardware backend
Message-ID: <20190920042138.GA11868@___>
References: <20190917010204.30376-1-tiwei.bie@intel.com>
	<20190917010204.30376-4-tiwei.bie@intel.com>
	<0b0f74ba-8958-dd7d-3e98-f7a58b1ec5f7@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0b0f74ba-8958-dd7d-3e98-f7a58b1ec5f7@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
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

T24gVHVlLCBTZXAgMTcsIDIwMTkgYXQgMDM6MjY6MzBQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiBPbiAyMDE5LzkvMTcg5LiK5Y2IOTowMiwgVGl3ZWkgQmllIHdyb3RlOgo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdmhvc3QvbWRldi5jIGIvZHJpdmVycy92aG9zdC9tZGV2LmMKPiA+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjhjNjU5N2FmZjQ1ZQo+
ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvZHJpdmVycy92aG9zdC9tZGV2LmMKPiA+IEBAIC0w
LDAgKzEsNDYyIEBACj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiA+
ICsvKgo+ID4gKyAqIENvcHlyaWdodCAoQykgMjAxOC0yMDE5IEludGVsIENvcnBvcmF0aW9uLgo+
ID4gKyAqLwo+ID4gKwo+ID4gKyNpbmNsdWRlIDxsaW51eC9jb21wYXQuaD4KPiA+ICsjaW5jbHVk
ZSA8bGludXgva2VybmVsLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L21pc2NkZXZpY2UuaD4KPiA+
ICsjaW5jbHVkZSA8bGludXgvbWRldi5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4K
PiA+ICsjaW5jbHVkZSA8bGludXgvdmZpby5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC92aG9zdC5o
Pgo+ID4gKyNpbmNsdWRlIDxsaW51eC92aXJ0aW9fbWRldi5oPgo+ID4gKwo+ID4gKyNpbmNsdWRl
ICJ2aG9zdC5oIgo+ID4gKwo+ID4gK3N0cnVjdCB2aG9zdF9tZGV2IHsKPiA+ICsJc3RydWN0IG11
dGV4IG11dGV4Owo+ID4gKwlzdHJ1Y3Qgdmhvc3RfZGV2IGRldjsKPiA+ICsJc3RydWN0IHZob3N0
X3ZpcnRxdWV1ZSAqdnFzOwo+ID4gKwlpbnQgbnZxczsKPiA+ICsJdTY0IHN0YXRlOwo+ID4gKwl1
NjQgZmVhdHVyZXM7Cj4gPiArCXU2NCBhY2tlZF9mZWF0dXJlczsKPiA+ICsJc3RydWN0IHZmaW9f
Z3JvdXAgKnZmaW9fZ3JvdXA7Cj4gPiArCXN0cnVjdCB2ZmlvX2RldmljZSAqdmZpb19kZXZpY2U7
Cj4gPiArCXN0cnVjdCBtZGV2X2RldmljZSAqbWRldjsKPiA+ICt9Owo+ID4gKwo+ID4gKy8qCj4g
PiArICogWFhYCj4gPiArICogV2UgYXNzdW1lIHZpcnRpb19tZGV2LmtvIGV4cG9zZXMgYmVsb3cg
c3ltYm9scyBmb3Igbm93LCBhcyB3ZQo+ID4gKyAqIGRvbid0IGhhdmUgYSBwcm9wZXIgd2F5IHRv
IGFjY2VzcyBwYXJlbnQgb3BzIGRpcmVjdGx5IHlldC4KPiA+ICsgKgo+ID4gKyAqIHZpcnRpb19t
ZGV2X3JlYWRsKCkKPiA+ICsgKiB2aXJ0aW9fbWRldl93cml0ZWwoKQo+ID4gKyAqLwo+ID4gK2V4
dGVybiB1MzIgdmlydGlvX21kZXZfcmVhZGwoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2LCBsb2Zm
X3Qgb2ZmKTsKPiA+ICtleHRlcm4gdm9pZCB2aXJ0aW9fbWRldl93cml0ZWwoc3RydWN0IG1kZXZf
ZGV2aWNlICptZGV2LCBsb2ZmX3Qgb2ZmLCB1MzIgdmFsKTsKPiAKPiAKPiBOZWVkIHRvIGNvbnNp
ZGVyIGEgYmV0dGVyIGFwcHJvYWNoLCBJIGZlZWwgd2Ugc2hvdWxkIGRvIGl0IHRocm91Z2ggc29t
ZSBraW5kCj4gb2YgbWRldiBkcml2ZXIgaW5zdGVhZCBvZiB0YWxrIHRvIG1kZXYgZGV2aWNlIGRp
cmVjdGx5LgoKWWVhaCwgYSBiZXR0ZXIgYXBwcm9hY2ggaXMgcmVhbGx5IG5lZWRlZCBoZXJlLgpC
ZXNpZGVzLCB3ZSBtYXkgd2FudCBhIHdheSB0byBhbGxvdyBhY2Nlc3NpbmcgdGhlIG1kZXYKZGV2
aWNlX29wcyBwcm9wb3NlZCBpbiBiZWxvdyBzZXJpZXMgb3V0c2lkZSB0aGUKZHJpdmVycy92Zmlv
L21kZXYvIGRpcmVjdG9yeS4KCmh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5LzkvMTIvMTUxCgpJ
LmUuIGFsbG93IHB1dHRpbmcgbWRldiBkcml2ZXJzIG91dHNpZGUgYWJvdmUgZGlyZWN0b3J5LgoK
Cj4gPiArCj4gPiArCWZvciAocXVldWVfaWQgPSAwOyBxdWV1ZV9pZCA8IG0tPm52cXM7IHF1ZXVl
X2lkKyspIHsKPiA+ICsJCXZxID0gJm0tPnZxc1txdWV1ZV9pZF07Cj4gPiArCj4gPiArCQlpZiAo
IXZxLT5kZXNjIHx8ICF2cS0+YXZhaWwgfHwgIXZxLT51c2VkKQo+ID4gKwkJCWJyZWFrOwo+ID4g
Kwo+ID4gKwkJdmlydGlvX21kZXZfd3JpdGVsKG1kZXYsIFZJUlRJT19NREVWX1FVRVVFX05VTSwg
dnEtPm51bSk7Cj4gPiArCj4gPiArCQlpZiAoIXZob3N0X3RyYW5zbGF0ZV9yaW5nX2FkZHIodnEs
ICh1NjQpdnEtPmRlc2MsCj4gPiArCQkJCQkgICAgICAgdmhvc3RfZ2V0X2Rlc2Nfc2l6ZSh2cSwg
dnEtPm51bSksCj4gPiArCQkJCQkgICAgICAgJmFkZHIpKQo+ID4gKwkJCXJldHVybiAtRUlOVkFM
Owo+IAo+IAo+IEludGVyZXN0aW5nLCBhbnkgcmVhc29uIGZvciBkb2luZyBzdWNoIGtpbmRzIG9m
IHRyYW5zbGF0aW9uIHRvIEhWQT8gSQo+IGJlbGlldmUgdGhlIGFkZCBzaG91bGQgYWxyZWFkeSBh
biBJT1ZBIHRoYXQgaGFzIGJlZW4gbWFwIGJ5IFZGSU8uCgpDdXJyZW50bHksIGluIHRoZSBzb2Z0
d2FyZSBiYXNlZCB2aG9zdC1rZXJuZWwgYW5kIHZob3N0LXVzZXIKYmFja2VuZHMsIFFFTVUgd2ls
bCBwYXNzIHJpbmcgYWRkcmVzc2VzIGFzIEhWQSBpbiBTRVRfVlJJTkdfQUREUgppb2N0bCB3aGVu
IGlvdGxiIGlzbid0IGVuYWJsZWQuIElmIGl0J3MgT0sgdG8gbGV0IFFFTVUgcGFzcyBHUEEKaW4g
dmhvc3QtbWRldiBpbiB0aGlzIGNhc2UsIHRoZW4gdGhpcyB0cmFuc2xhdGlvbiB3b24ndCBiZSBu
ZWVkZWQuCgpUaGFua3MsClRpd2VpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBs
aXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5v
cmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
