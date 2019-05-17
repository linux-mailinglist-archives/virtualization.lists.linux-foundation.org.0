Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFF721D26
	for <lists.virtualization@lfdr.de>; Fri, 17 May 2019 20:10:59 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1EEB2C37;
	Fri, 17 May 2019 18:10:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C0C73B4B
	for <virtualization@lists.linux-foundation.org>;
	Fri, 17 May 2019 18:10:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6C83B875
	for <virtualization@lists.linux-foundation.org>;
	Fri, 17 May 2019 18:10:52 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
	[83.86.89.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id ABAFB21734;
	Fri, 17 May 2019 18:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1558116652;
	bh=J5RwK2qHQIcT3y2vsCaqdKAjdj5CtRHH5T01yuTQkwE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OuQa8+mP4xStuzMr/lOK9TAzQHfWXrGffvPdqBMCFCDh4iAVHZ1OzKMrvMv9WjsUE
	5TJy5vkIMufLFFbCBLkhcavKX+h6NWGS+oJMMWDvloQGxTxS2B94BWkO9IzVwNMBCM
	PBAq5LiLQ2fYPaWgZxYIIlmP7XPOZPWHsHgYsUho=
Date: Fri, 17 May 2019 20:10:49 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nadav Amit <namit@vmware.com>
Subject: Re: [PATCH v4 0/4] vmw_balloon: Compaction and shrinker support
Message-ID: <20190517181049.GA25765@kroah.com>
References: <20190425115445.20815-1-namit@vmware.com>
	<8A2D1D43-759A-4B09-B781-31E9002AE3DA@vmware.com>
	<9AD9FE33-1825-4D1A-914F-9C29DF93DC8D@vmware.com>
	<20190517172429.GA21509@kroah.com>
	<26FEBE86-AF49-428F-9C9F-1FA435ADCB54@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <26FEBE86-AF49-428F-9C9F-1FA435ADCB54@vmware.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Arnd Bergmann <arnd@arndb.de>, "Michael S. Tsirkin" <mst@redhat.com>,
	Pv-drivers <Pv-drivers@vmware.com>, lkml <linux-kernel@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>, Linux-MM <linux-mm@kvack.org>,
	Julien Freche <jfreche@vmware.com>
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

T24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgMDU6NTc6MjJQTSArMDAwMCwgTmFkYXYgQW1pdCB3cm90
ZToKPiA+IE9uIE1heSAxNywgMjAxOSwgYXQgMTA6MjQgQU0sIEdyZWcgS3JvYWgtSGFydG1hbiA8
Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+ID4gCj4gPiBPbiBGcmksIE1heSAx
NywgMjAxOSBhdCAwNToxMDoyM1BNICswMDAwLCBOYWRhdiBBbWl0IHdyb3RlOgo+ID4+PiBPbiBN
YXkgMywgMjAxOSwgYXQgNjoyNSBQTSwgTmFkYXYgQW1pdCA8bmFtaXRAdm13YXJlLmNvbT4gd3Jv
dGU6Cj4gPj4+IAo+ID4+Pj4gT24gQXByIDI1LCAyMDE5LCBhdCA0OjU0IEFNLCBOYWRhdiBBbWl0
IDxuYW1pdEB2bXdhcmUuY29tPiB3cm90ZToKPiA+Pj4+IAo+ID4+Pj4gVk13YXJlIGJhbGxvb24g
ZW5oYW5jZW1lbnRzOiBhZGRpbmcgc3VwcG9ydCBmb3IgbWVtb3J5IGNvbXBhY3Rpb24sCj4gPj4+
PiBtZW1vcnkgc2hyaW5rZXIgKHRvIHByZXZlbnQgT09NKSBhbmQgc3BsaXR0aW5nIG9mIHJlZnVz
ZWQgcGFnZXMgdG8KPiA+Pj4+IHByZXZlbnQgcmVjdXJyaW5nIGluZmxhdGlvbnMuCj4gPj4+PiAK
PiA+Pj4+IFBhdGNoZXMgMS0yOiBTdXBwb3J0IGZvciBjb21wYWN0aW9uCj4gPj4+PiBQYXRjaCAz
OiBTdXBwb3J0IGZvciBtZW1vcnkgc2hyaW5rZXIgLSBkaXNhYmxlZCBieSBkZWZhdWx0Cj4gPj4+
PiBQYXRjaCA0OiBTcGxpdCByZWZ1c2VkIHBhZ2VzIHRvIGltcHJvdmUgcGVyZm9ybWFuY2UKPiA+
Pj4+IAo+ID4+Pj4gdjMtPnY0Ogo+ID4+Pj4gKiAiZ2V0IGFyb3VuZCB0byIgY29tbWVudCBbTWlj
aGFlbF0KPiA+Pj4+ICogUHV0IGxpc3RfYWRkIHVuZGVyIHBhZ2UgbG9jayBbTWljaGFlbF0KPiA+
Pj4+IAo+ID4+Pj4gdjItPnYzOgo+ID4+Pj4gKiBGaXhpbmcgd3JvbmcgYXJndW1lbnQgdHlwZSAo
aW50LT5zaXplX3QpIFtNaWNoYWVsXQo+ID4+Pj4gKiBGaXhpbmcgYSBjb21tZW50IChpdCkgW01p
Y2hhZWxdCj4gPj4+PiAqIFJlaW5zdGF0aW5nIHRoZSBCVUdfT04oKSB3aGVuIHBhZ2UgaXMgbG9j
a2VkIFtNaWNoYWVsXSAKPiA+Pj4+IAo+ID4+Pj4gdjEtPnYyOgo+ID4+Pj4gKiBSZXR1cm4gbnVt
YmVyIG9mIHBhZ2VzIGluIGxpc3QgZW5xdWV1ZS9kZXF1ZXVlIGludGVyZmFjZXMgW01pY2hhZWxd
Cj4gPj4+PiAqIFJlbW92ZWQgZmlyc3QgdHdvIHBhdGNoZXMgd2hpY2ggd2VyZSBhbHJlYWR5IG1l
cmdlZAo+ID4+Pj4gCj4gPj4+PiBOYWRhdiBBbWl0ICg0KToKPiA+Pj4+IG1tL2JhbGxvb25fY29t
cGFjdGlvbjogTGlzdCBpbnRlcmZhY2VzCj4gPj4+PiB2bXdfYmFsbG9vbjogQ29tcGFjdGlvbiBz
dXBwb3J0Cj4gPj4+PiB2bXdfYmFsbG9vbjogQWRkIG1lbW9yeSBzaHJpbmtlcgo+ID4+Pj4gdm13
X2JhbGxvb246IFNwbGl0IHJlZnVzZWQgcGFnZXMKPiA+Pj4+IAo+ID4+Pj4gZHJpdmVycy9taXNj
L0tjb25maWcgICAgICAgICAgICAgICB8ICAgMSArCj4gPj4+PiBkcml2ZXJzL21pc2Mvdm13X2Jh
bGxvb24uYyAgICAgICAgIHwgNDg5ICsrKysrKysrKysrKysrKysrKysrKysrKysrLS0tCj4gPj4+
PiBpbmNsdWRlL2xpbnV4L2JhbGxvb25fY29tcGFjdGlvbi5oIHwgICA0ICsKPiA+Pj4+IG1tL2Jh
bGxvb25fY29tcGFjdGlvbi5jICAgICAgICAgICAgfCAxNDQgKysrKysrLS0tCj4gPj4+PiA0IGZp
bGVzIGNoYW5nZWQsIDU1MyBpbnNlcnRpb25zKCspLCA4NSBkZWxldGlvbnMoLSkKPiA+Pj4+IAo+
ID4+Pj4gLS0gCj4gPj4+PiAyLjE5LjEKPiA+Pj4gCj4gPj4+IFBpbmcuCj4gPj4gCj4gPj4gUGlu
Zy4KPiA+PiAKPiA+PiBHcmVnLCBkaWQgaXQgZ290IGxvc3QgYWdhaW4/Cj4gPiAKPiA+IAo+ID4g
SSB0aG91Z2h0IHlvdSBuZWVkZWQgdGhlIG1tIGRldmVsb3BlcnMgdG8gYWNrIHRoZSBmaXJzdCBw
YXRjaCwgZGlkIHRoYXQKPiA+IGV2ZXIgaGFwcGVuPwo+IAo+IFllcy4gWW91IHdpbGwgc2VlIE1p
Y2hhZWwgVHNpcmtpbuKAmXMg4oCcQWNrZWQtYnkiIG9uIGl0LgoKQWgsIG1pc3NlZCB0aGF0LCB0
aGFua3MuICBXaWxsIHF1ZXVlIHRoaXMgdXAgYWZ0ZXIgdGhlIC1yYzEgcmVsZWFzZSBpcwpvdXQs
IGNhbid0IGRvIGFueXRoaW5nIHVudGlsIHRoZW4uCgpncmVnIGstaApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxp
c3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0
cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
