Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AC5F2718
	for <lists.virtualization@lfdr.de>; Thu,  7 Nov 2019 06:25:18 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1AC15C59;
	Thu,  7 Nov 2019 05:25:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AF6F8B1F
	for <virtualization@lists.linux-foundation.org>;
	Thu,  7 Nov 2019 05:25:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4D0FD67F
	for <virtualization@lists.linux-foundation.org>;
	Thu,  7 Nov 2019 05:25:11 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Nov 2019 21:25:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,276,1569308400"; d="scan'208";a="233139016"
Received: from dpdk-virtio-tbie-2.sh.intel.com (HELO ___) ([10.67.104.74])
	by fmsmga002.fm.intel.com with ESMTP; 06 Nov 2019 21:25:08 -0800
Date: Thu, 7 Nov 2019 13:25:54 +0800
From: Tiwei Bie <tiwei.bie@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v5] vhost: introduce mdev based hardware backend
Message-ID: <20191107052554.GA27721@___>
References: <20191105115332.11026-1-tiwei.bie@intel.com>
	<20191106075733-mutt-send-email-mst@kernel.org>
	<20191106143907.GA10776@___>
	<def13888-c99f-5f59-647b-05a4bb2f8657@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <def13888-c99f-5f59-647b-05a4bb2f8657@redhat.com>
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

T24gVGh1LCBOb3YgMDcsIDIwMTkgYXQgMTI6MTY6MDFQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiBPbiAyMDE5LzExLzYg5LiL5Y2IMTA6MzksIFRpd2VpIEJpZSB3cm90ZToKPiA+IE9uIFdl
ZCwgTm92IDA2LCAyMDE5IGF0IDA3OjU5OjAyQU0gLTA1MDAsIE1pY2hhZWwgUy4gVHNpcmtpbiB3
cm90ZToKPiA+ID4gT24gVHVlLCBOb3YgMDUsIDIwMTkgYXQgMDc6NTM6MzJQTSArMDgwMCwgVGl3
ZWkgQmllIHdyb3RlOgo+ID4gPiA+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBhIG1kZXYgYmFzZWQg
aGFyZHdhcmUgdmhvc3QgYmFja2VuZC4KPiA+ID4gPiBUaGlzIGJhY2tlbmQgaXMgYnVpbHQgb24g
dG9wIG9mIHRoZSBzYW1lIGFic3RyYWN0aW9uIHVzZWQKPiA+ID4gPiBpbiB2aXJ0aW8tbWRldiBh
bmQgcHJvdmlkZXMgYSBnZW5lcmljIHZob3N0IGludGVyZmFjZSBmb3IKPiA+ID4gPiB1c2Vyc3Bh
Y2UgdG8gYWNjZWxlcmF0ZSB0aGUgdmlydGlvIGRldmljZXMgaW4gZ3Vlc3QuCj4gPiA+ID4gCj4g
PiA+ID4gVGhpcyBiYWNrZW5kIGlzIGltcGxlbWVudGVkIGFzIGEgbWRldiBkZXZpY2UgZHJpdmVy
IG9uIHRvcAo+ID4gPiA+IG9mIHRoZSBzYW1lIG1kZXYgZGV2aWNlIG9wcyB1c2VkIGluIHZpcnRp
by1tZGV2IGJ1dCB1c2luZwo+ID4gPiA+IGEgZGlmZmVyZW50IG1kZXYgY2xhc3MgaWQsIGFuZCBp
dCB3aWxsIHJlZ2lzdGVyIHRoZSBkZXZpY2UKPiA+ID4gPiBhcyBhIFZGSU8gZGV2aWNlIGZvciB1
c2Vyc3BhY2UgdG8gdXNlLiBVc2Vyc3BhY2UgY2FuIHNldHVwCj4gPiA+ID4gdGhlIElPTU1VIHdp
dGggdGhlIGV4aXN0aW5nIFZGSU8gY29udGFpbmVyL2dyb3VwIEFQSXMgYW5kCj4gPiA+ID4gdGhl
biBnZXQgdGhlIGRldmljZSBmZCB3aXRoIHRoZSBkZXZpY2UgbmFtZS4gQWZ0ZXIgZ2V0dGluZwo+
ID4gPiA+IHRoZSBkZXZpY2UgZmQsIHVzZXJzcGFjZSBjYW4gdXNlIHZob3N0IGlvY3RscyBvbiB0
b3Agb2YgaXQKPiA+ID4gPiB0byBzZXR1cCB0aGUgYmFja2VuZC4KPiA+ID4gPiAKPiA+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBUaXdlaSBCaWUgPHRpd2VpLmJpZUBpbnRlbC5jb20+Cj4gPiA+IFNvIGF0
IHRoaXMgcG9pbnQsIGxvb2tzIGxpa2UgdGhlIG9ubHkgdGhpbmcgbWlzc2luZyBpcyBJRkMsIGFu
ZCB0aGVuIGFsbAo+ID4gPiB0aGVzZSBwYXRjaGVzIGNhbiBnbyBpbi4KPiA+ID4gQnV0IGFzIElG
QyBpcyBzdGlsbCBiZWluZyB3b3JrZWQgb24gYW55d2F5LCBpdCBtYWtlcyBzZW5zZSB0bwo+ID4g
PiBhZGRyZXNzIHRoZSBtaW5vciBjb21tZW50cyBtYW53aGlsZSBzbyB3ZSBkb24ndCBuZWVkCj4g
PiA+IHBhdGNoZXMgb24gdG9wLgo+ID4gPiBSaWdodD8KPiA+IFllYWgsIG9mIGNvdXJzZS4KPiA+
IAo+ID4gVGhhbmtzLAo+ID4gVGl3ZWkKPiAKPiAKPiBQbGVhc2Ugc2VuZCBWNiBhbmQgSSB3aWxs
IGFjayB0aGVyZS4KCkdvdCBpdCwgSSB3aWxsIHNlbmQgaXQgc29vbi4KClRoYW5rcyEKVGl3ZWkK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6
YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24u
b3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3Zp
cnR1YWxpemF0aW9u
