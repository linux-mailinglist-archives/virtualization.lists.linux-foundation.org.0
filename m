Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 389D6F2720
	for <lists.virtualization@lfdr.de>; Thu,  7 Nov 2019 06:26:32 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id F3F23C86;
	Thu,  7 Nov 2019 05:26:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 71978C86
	for <virtualization@lists.linux-foundation.org>;
	Thu,  7 Nov 2019 05:26:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0D3D5710
	for <virtualization@lists.linux-foundation.org>;
	Thu,  7 Nov 2019 05:26:21 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Nov 2019 21:26:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,276,1569308400"; d="scan'208";a="196446989"
Received: from dpdk-virtio-tbie-2.sh.intel.com (HELO ___) ([10.67.104.74])
	by orsmga008.jf.intel.com with ESMTP; 06 Nov 2019 21:26:19 -0800
Date: Thu, 7 Nov 2019 13:27:05 +0800
From: Tiwei Bie <tiwei.bie@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v5] vhost: introduce mdev based hardware backend
Message-ID: <20191107052705.GA28713@___>
References: <20191105115332.11026-1-tiwei.bie@intel.com>
	<16f31c27-3a0e-09d7-3925-dc9777f5e229@redhat.com>
	<20191106122249.GA3235@___>
	<20191106075607-mutt-send-email-mst@kernel.org>
	<580dfa2c-f1ff-2f6f-bbc8-1c4b0a829a3d@redhat.com>
	<20191106144952.GA10926@___>
	<914081d6-40ee-f184-ff43-c3d4cd885fba@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <914081d6-40ee-f184-ff43-c3d4cd885fba@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
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

T24gVGh1LCBOb3YgMDcsIDIwMTkgYXQgMTI6MDg6MDhQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiBPbiAyMDE5LzExLzYg5LiL5Y2IMTA6NDksIFRpd2VpIEJpZSB3cm90ZToKPiA+ID4gPiA+
ID4gPiArCWRlZmF1bHQ6Cj4gPiA+ID4gPiA+ID4gKwkJLyoKPiA+ID4gPiA+ID4gPiArCQkgKiBW
SE9TVF9TRVRfTUVNX1RBQkxFLCBWSE9TVF9TRVRfTE9HX0JBU0UsIGFuZAo+ID4gPiA+ID4gPiA+
ICsJCSAqIFZIT1NUX1NFVF9MT0dfRkQgYXJlIG5vdCB1c2VkIHlldC4KPiA+ID4gPiA+ID4gPiAr
CQkgKi8KPiA+ID4gPiA+ID4gSWYgd2UgZG9uJ3QgZXZlbiB1c2UgdGhlbSwgdGhlcmUncyBwcm9i
YWJseSBubyBuZWVkIHRvIGNhbGwKPiA+ID4gPiA+ID4gdmhvc3RfZGV2X2lvY3RsKCkuIFRoaXMg
bWF5IGhlbHAgdG8gYXZvaWQgY29uZnVzaW9uIHdoZW4gd2Ugd2FudCB0byBkZXZlbG9wCj4gPiA+
ID4gPiA+IG5ldyBBUEkgZm9yIGUuZyBkaXJ0eSBwYWdlIHRyYWNraW5nLgo+ID4gPiA+ID4gR29v
ZCBwb2ludC4gSXQncyBiZXR0ZXIgdG8gcmVqZWN0IHRoZXNlIGlvY3RscyBmb3Igbm93Lgo+ID4g
PiA+ID4gCj4gPiA+ID4gPiBQUy4gT25lIHRoaW5nIEkgbWF5IG5lZWQgdG8gY2xhcmlmeSBpcyB0
aGF0LCB3ZSBuZWVkIHRoZQo+ID4gPiA+ID4gVkhPU1RfU0VUX09XTkVSIGlvY3RsIHRvIGdldCB0
aGUgdnEtPmhhbmRsZV9raWNrIHRvIHdvcmsuCj4gPiA+ID4gPiBTbyBpZiB3ZSBkb24ndCBjYWxs
IHZob3N0X2Rldl9pb2N0bCgpLCB3ZSB3aWxsIG5lZWQgdG8KPiA+ID4gPiA+IGNhbGwgdmhvc3Rf
ZGV2X3NldF9vd25lcigpIGRpcmVjdGx5Lgo+ID4gPiBJIG1heSBtaXNzIHNvbWV0aGluZywgaXQg
bG9va3MgdG8gbWUgdGhlIHRoZXJlJ3Mgbm8gb3duZXIgY2hlY2sgaW4KPiA+ID4gdmhvc3RfdnJp
bmdfaW9jdGwoKSBhbmQgdGhlIHZob3N0X3BvbGxfc3RhcnQoKSBjYW4gbWFrZSBzdXJlIGhhbmRs
ZV9raWNrCj4gPiA+IHdvcmtzPwo+ID4gWWVhaCwgdGhlcmUgaXMgbm8gb3duZXIgY2hlY2sgaW4g
dmhvc3RfdnJpbmdfaW9jdGwoKS4KPiA+IElJVUMsIHZob3N0X3BvbGxfc3RhcnQoKSB3aWxsIHN0
YXJ0IHBvbGxpbmcgdGhlIGZpbGUuIEFuZCB3aGVuCj4gPiBldmVudCBhcnJpdmVzLCB2aG9zdF9w
b2xsX3dha2V1cCgpIHdpbGwgYmUgY2FsbGVkLCBhbmQgaXQgd2lsbAo+ID4gcXVldWUgd29yayB0
byB3b3JrX2xpc3QgYW5kIHdha2V1cCB3b3JrZXIgdG8gZmluaXNoIHRoZSB3b3JrLgo+ID4gQW5k
IHRoZSB3b3JrZXIgaXMgY3JlYXRlZCBieSB2aG9zdF9kZXZfc2V0X293bmVyKCkuCj4gPiAKPiAK
PiBSaWdodCwgcmV0aGluayBhYm91dCB0aGlzLiBJdCBsb29rcyB0byBtZSB3ZSBuZWVkOgo+IAo+
IC0gS2VlcCBWSE9TVF9TRVRfT1dORVIsIHRoaXMgY291bGQgYmUgdXNlZCBmb3IgZnV0dXJlIGNv
bnRyb2wgdnEgd2hlcmUgaXQKPiBuZWVkcyBhIGt0aHJlYWQgdG8gYWNjZXNzIHRoZSB1c2Vyc3Bh
Y2UgbWVtb3J5Cj4gCj4gLSBUZW1wb3JhcmlseSBmaWx0ZXLCoCBTRVRfTE9HX0JBU0UgYW5kIFNF
VF9MT0dfRkQgdW50aWwgd2UgZmluYWxpemUgdGhlIEFQSQo+IGZvciBkaXJ0eSBwYWdlIHRyYWNr
aW5nLgo+IAo+IC0gRm9yIGtpY2sgdGhyb3VnaCBrdGhyZWFkLCBpdCBsb29rcyBzdWItb3B0aW1h
bCBidXQgd2UgY2FuIGFkZHJlc3MgdGhpcyBpbgo+IHRoZSBmdXR1cmUsIGUuZyBjYWxsIGhhbmRs
ZV92cV9raWNrIGRpcmVjdGx5IGluIHZob3N0X3BvbGxfcXVldWUgKHByb2JhYmx5IGEKPiBmbGFn
IGZvciB2aG9zdF9wb2xsKSBhbmQgZGVhbCB3aXRoIHRoZSBzeW5jaHJvbml6YXRpb24gaW4gdmhv
c3RfcG9sbF9mbHVzaAo+IGNhcmVmdWxseS4KCk9LLgoKVGhhbmtzLApUaXdlaQoKPiAKPiBUaGFu
a3MKPiAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
VmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3ZpcnR1YWxpemF0aW9u
