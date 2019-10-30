Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EF5E9B2B
	for <lists.virtualization@lfdr.de>; Wed, 30 Oct 2019 12:53:56 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5A1F4CDB;
	Wed, 30 Oct 2019 11:53:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 648AACB0
	for <virtualization@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 11:53:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CB20F8A
	for <virtualization@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 11:53:46 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Oct 2019 04:53:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,247,1569308400"; d="scan'208";a="401479933"
Received: from dpdk-virtio-tbie-2.sh.intel.com (HELO ___) ([10.67.104.74])
	by fmsmga006.fm.intel.com with ESMTP; 30 Oct 2019 04:53:43 -0700
Date: Wed, 30 Oct 2019 19:54:33 +0800
From: Tiwei Bie <tiwei.bie@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [RFC] vhost_mdev: add network control vq support
Message-ID: <20191030115433.GA27220@___>
References: <20191029101726.12699-1-tiwei.bie@intel.com>
	<59474431-9e77-567c-9a46-a3965f587f65@redhat.com>
	<20191030061711.GA11968@___>
	<39aa9f66-8e58-ea63-5795-7df8861ff3a0@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <39aa9f66-8e58-ea63-5795-7df8861ff3a0@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	zhihong.wang@intel.com, lingshan.zhu@intel.com
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

T24gV2VkLCBPY3QgMzAsIDIwMTkgYXQgMDM6MDQ6MzdQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiBPbiAyMDE5LzEwLzMwIOS4i+WNiDI6MTcsIFRpd2VpIEJpZSB3cm90ZToKPiA+IE9uIFR1
ZSwgT2N0IDI5LCAyMDE5IGF0IDA2OjUxOjMyUE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4g
Pj4gT24gMjAxOS8xMC8yOSDkuIvljYg2OjE3LCBUaXdlaSBCaWUgd3JvdGU6Cj4gPj4+IFRoaXMg
cGF0Y2ggYWRkcyB0aGUgbmV0d29yayBjb250cm9sIHZxIHN1cHBvcnQgaW4gdmhvc3QtbWRldi4K
PiA+Pj4gQSB2aG9zdC1tZGV2IHNwZWNpZmljIG9wIGlzIGludHJvZHVjZWQgdG8gYWxsb3cgcGFy
ZW50IGRyaXZlcnMKPiA+Pj4gdG8gaGFuZGxlIHRoZSBuZXR3b3JrIGNvbnRyb2wgY29tbWFuZHMg
Y29tZSBmcm9tIHVzZXJzcGFjZS4KPiA+PiBQcm9iYWJseSB3b3JrIGZvciB1c2Vyc3BhY2UgZHJp
dmVyIGJ1dCBub3Qga2VybmVsIGRyaXZlci4KPiA+IEV4YWN0bHkuIFRoaXMgaXMgb25seSBmb3Ig
dXNlcnNwYWNlLgo+ID4KPiA+IEkgZ290IHlvdXIgcG9pbnQgbm93LiBJbiB2aXJ0aW8tbWRldiBr
ZXJuZWwgZHJpdmVyIGNhc2UsCj4gPiB0aGUgY3RybC12cSBjYW4gYmUgc3BlY2lhbCBhcyB3ZWxs
Lgo+ID4KPiAKPiBUaGVuIG1heWJlIGl0J3MgYmV0dGVyIHRvIGludHJvZHVjZSB2aG9zdC1tZGV2
LW5ldCBvbiB0b3A/Cj4gCj4gTG9va2luZyBhdCB0aGUgb3RoZXIgdHlwZSBvZiB2aXJ0aW8gZGV2
aWNlOgo+IAo+IC0gY29uc29sZSBoYXZlIHR3byBjb250cm9sIHZpcnRxdWV1ZXMgd2hlbiBtdWx0
aXF1ZXVlIHBvcnQgaXMgZW5hYmxlZAo+IAo+IC0gU0NTSSBoYXMgY29udHJvbHEgKyBldmVudHEK
PiAKPiAtIEdQVSBoYXMgY29udHJvbHEKPiAKPiAtIENyeXB0byBkZXZpY2UgaGFzIG9uZSBjb250
cm9scQo+IAo+IC0gU29ja2V0IGhhcyBldmVudHEKPiAKPiAuLi4KClRoYW5rcyBmb3IgdGhlIGxp
c3QhIEl0IGxvb2tzIGRpcnR5IHRvIGRlZmluZSBzcGVjaWZpYwpjb21tYW5kcyBhbmQgdHlwZXMg
aW4gdmhvc3QgVUFQSSBmb3IgZWFjaCBvZiB0aGVtIGluIHRoZQpmdXR1cmUuIEl0J3MgZGVmaW5p
dGVseSBtdWNoIGJldHRlciB0byBmaW5kIGFuIGFwcHJvYWNoCnRvIHNvbHZlIGl0IG9uY2UgZm9y
IGFsbCBpZiBwb3NzaWJsZS4uCgpKdXN0IGEgcXVpY2sgdGhvdWdodCwgY29uc2lkZXJpbmcgYWxs
IHZob3N0LW1kZXYgZG9lcwppcyBqdXN0IHRvIGZvcndhcmQgc2V0dGluZ3MgYmV0d2VlbiBwYXJl
bnQgYW5kIHVzZXJzcGFjZSwKSSdtIHdvbmRlcmluZyB3aGV0aGVyIGl0J3MgcG9zc2libGUgdG8g
bWFrZSB0aGUgYXJncApvcGFxdWUgaW4gdmhvc3QtbWRldiBVQVBJIGFuZCBqdXN0IGludHJvZHVj
ZSBvbmUgZ2VuZXJpYwppb2N0bCBjb21tYW5kIHRvIGRlbGl2ZXIgdGhlc2UgZGV2aWNlIHNwZWNp
ZmljIGNvbW1hbmRzCih3aGljaCBhcmUgb3BhcXVlIGluIHZob3N0LW1kZXYgYXMgdmhvc3QtbWRl
diBqdXN0IHBhc3MKdGhlIHBvaW50ZXIgLS0gYXJncCkgZGVmaW5lZCBieSBzcGVjLgoKSSdtIGFs
c28gZmluZSB3aXRoIGV4cG9zaW5nIGN0cmxxIHRvIHVzZXJzcGFjZSBkaXJlY3RseS4KUFMuIEl0
J3MgaW50ZXJlc3RpbmcgdGhhdCBzb21lIGRldmljZXMgaGF2ZSBtb3JlIHRoYW4Kb25lIGN0cmxx
LiBJIG5lZWQgdG8gdGFrZSBhIGNsb3NlIGxvb2sgZmlyc3QuLgoKCj4gCj4gVGhhbmtzCj4gCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0
aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0
dWFsaXphdGlvbg==
