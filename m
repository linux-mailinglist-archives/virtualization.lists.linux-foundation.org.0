Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C1295E2C3F
	for <lists.virtualization@lfdr.de>; Thu, 24 Oct 2019 10:33:15 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BDCB8C3F;
	Thu, 24 Oct 2019 08:33:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5702ABA0
	for <virtualization@lists.linux-foundation.org>;
	Thu, 24 Oct 2019 08:33:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
	[205.139.110.61])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id AF6E487B
	for <virtualization@lists.linux-foundation.org>;
	Thu, 24 Oct 2019 08:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571905985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=GP6qD2J1CBmhiVD+sbR/nBuazK8LU9m7yhlITTEQS64=;
	b=AOlZgQZOV2vsGc3u91nDFVabCURQZD0C6/X53vifylKMPYENkQwKEiDql68+dxKTLUyj/u
	62wNz2SOtwZuyW1uAhWhfx9fKtMKBrnaPeVZCmDU4ELRdrNcovLpzn1lVTpIvlA7AoXpUH
	bjrD/K/9iWYY79k6M7rGZB/pYIqfMq4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-176-zHllE4ZJP_6HPNgUQkm_IQ-1; Thu, 24 Oct 2019 04:33:02 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B751A800D5A;
	Thu, 24 Oct 2019 08:33:00 +0000 (UTC)
Received: from [10.72.13.32] (ovpn-13-32.pek2.redhat.com [10.72.13.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3A93A5D717;
	Thu, 24 Oct 2019 08:32:43 +0000 (UTC)
Subject: Re: [PATCH v2] vhost: introduce mdev based hardware backend
From: Jason Wang <jasowang@redhat.com>
To: Tiwei Bie <tiwei.bie@intel.com>
References: <20191022095230.2514-1-tiwei.bie@intel.com>
	<47a572fd-5597-1972-e177-8ee25ca51247@redhat.com>
	<20191023030253.GA15401@___>
	<ac36f1e3-b972-71ac-fe0c-3db03e016dcf@redhat.com>
	<20191023070747.GA30533@___>
	<106834b5-dae5-82b2-0f97-16951709d075@redhat.com>
	<20191023101135.GA6367@___>
	<5a7bc5da-d501-2750-90bf-545dd55f85fa@redhat.com>
	<20191024042155.GA21090@___>
	<d37529e1-5147-bbe5-cb9d-299bd6d4aa1a@redhat.com>
Message-ID: <d4cc4f4e-2635-4041-2f68-cd043a97f25a@redhat.com>
Date: Thu, 24 Oct 2019 16:32:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d37529e1-5147-bbe5-cb9d-299bd6d4aa1a@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: zHllE4ZJP_6HPNgUQkm_IQ-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Ck9uIDIwMTkvMTAvMjQg5LiL5Y2INDowMywgSmFzb24gV2FuZyB3cm90ZToKPgo+IE9uIDIwMTkv
MTAvMjQg5LiL5Y2IMTI6MjEsIFRpd2VpIEJpZSB3cm90ZToKPj4gT24gV2VkLCBPY3QgMjMsIDIw
MTkgYXQgMDY6Mjk6MjFQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4+IE9uIDIwMTkvMTAv
MjMg5LiL5Y2INjoxMSwgVGl3ZWkgQmllIHdyb3RlOgo+Pj4+IE9uIFdlZCwgT2N0IDIzLCAyMDE5
IGF0IDAzOjI1OjAwUE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+Pj4+IE9uIDIwMTkvMTAv
MjMg5LiL5Y2IMzowNywgVGl3ZWkgQmllIHdyb3RlOgo+Pj4+Pj4gT24gV2VkLCBPY3QgMjMsIDIw
MTkgYXQgMDE6NDY6MjNQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4+Pj4+PiBPbiAyMDE5
LzEwLzIzIOS4iuWNiDExOjAyLCBUaXdlaSBCaWUgd3JvdGU6Cj4+Pj4+Pj4+IE9uIFR1ZSwgT2N0
IDIyLCAyMDE5IGF0IDA5OjMwOjE2UE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+Pj4+Pj4+
PiBPbiAyMDE5LzEwLzIyIOS4i+WNiDU6NTIsIFRpd2VpIEJpZSB3cm90ZToKPj4+Pj4+Pj4+PiBU
aGlzIHBhdGNoIGludHJvZHVjZXMgYSBtZGV2IGJhc2VkIGhhcmR3YXJlIHZob3N0IGJhY2tlbmQu
Cj4+Pj4+Pj4+Pj4gVGhpcyBiYWNrZW5kIGlzIGJ1aWx0IG9uIHRvcCBvZiB0aGUgc2FtZSBhYnN0
cmFjdGlvbiB1c2VkCj4+Pj4+Pj4+Pj4gaW4gdmlydGlvLW1kZXYgYW5kIHByb3ZpZGVzIGEgZ2Vu
ZXJpYyB2aG9zdCBpbnRlcmZhY2UgZm9yCj4+Pj4+Pj4+Pj4gdXNlcnNwYWNlIHRvIGFjY2VsZXJh
dGUgdGhlIHZpcnRpbyBkZXZpY2VzIGluIGd1ZXN0Lgo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gVGhp
cyBiYWNrZW5kIGlzIGltcGxlbWVudGVkIGFzIGEgbWRldiBkZXZpY2UgZHJpdmVyIG9uIHRvcAo+
Pj4+Pj4+Pj4+IG9mIHRoZSBzYW1lIG1kZXYgZGV2aWNlIG9wcyB1c2VkIGluIHZpcnRpby1tZGV2
IGJ1dCB1c2luZwo+Pj4+Pj4+Pj4+IGEgZGlmZmVyZW50IG1kZXYgY2xhc3MgaWQsIGFuZCBpdCB3
aWxsIHJlZ2lzdGVyIHRoZSBkZXZpY2UKPj4+Pj4+Pj4+PiBhcyBhIFZGSU8gZGV2aWNlIGZvciB1
c2Vyc3BhY2UgdG8gdXNlLiBVc2Vyc3BhY2UgY2FuIHNldHVwCj4+Pj4+Pj4+Pj4gdGhlIElPTU1V
IHdpdGggdGhlIGV4aXN0aW5nIFZGSU8gY29udGFpbmVyL2dyb3VwIEFQSXMgYW5kCj4+Pj4+Pj4+
Pj4gdGhlbiBnZXQgdGhlIGRldmljZSBmZCB3aXRoIHRoZSBkZXZpY2UgbmFtZS4gQWZ0ZXIgZ2V0
dGluZwo+Pj4+Pj4+Pj4+IHRoZSBkZXZpY2UgZmQgb2YgdGhpcyBkZXZpY2UsIHVzZXJzcGFjZSBj
YW4gdXNlIHZob3N0IGlvY3Rscwo+Pj4+Pj4+Pj4+IHRvIHNldHVwIHRoZSBiYWNrZW5kLgo+Pj4+
Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogVGl3ZWkgQmllIDx0aXdlaS5iaWVAaW50
ZWwuY29tPgo+Pj4+Pj4+Pj4+IC0tLQo+Pj4+Pj4+Pj4+IFRoaXMgcGF0Y2ggZGVwZW5kcyBvbiBi
ZWxvdyBzZXJpZXM6Cj4+Pj4+Pj4+Pj4gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTkvMTAvMTcv
Mjg2Cj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiB2MSAtPiB2MjoKPj4+Pj4+Pj4+PiAtIFJlcGxhY2Ug
X1NFVF9TVEFURSB3aXRoIF9TRVRfU1RBVFVTIChNU1QpOwo+Pj4+Pj4+Pj4+IC0gQ2hlY2sgc3Rh
dHVzIGJpdHMgYXQgZWFjaCBzdGVwIChNU1QpOwo+Pj4+Pj4+Pj4+IC0gUmVwb3J0IHRoZSBtYXgg
cmluZyBzaXplIGFuZCBtYXggbnVtYmVyIG9mIHF1ZXVlcyAoTVNUKTsKPj4+Pj4+Pj4+PiAtIEFk
ZCBtaXNzaW5nIE1PRFVMRV9ERVZJQ0VfVEFCTEUgKEphc29uKTsKPj4+Pj4+Pj4+PiAtIE9ubHkg
c3VwcG9ydCB0aGUgbmV0d29yayBiYWNrZW5kIHcvbyBtdWx0aXF1ZXVlIGZvciBub3c7Cj4+Pj4+
Pj4+PiBBbnkgaWRlYSBvbiBob3cgdG8gZXh0ZW5kIGl0IHRvIHN1cHBvcnQgZGV2aWNlcyBvdGhl
ciB0aGFuIAo+Pj4+Pj4+Pj4gbmV0PyBJIHRoaW5rIHdlCj4+Pj4+Pj4+PiB3YW50IGEgZ2VuZXJp
YyBBUEkgb3IgYW4gQVBJIHRoYXQgY291bGQgYmUgbWFkZSBnZW5lcmljIGluIHRoZSAKPj4+Pj4+
Pj4+IGZ1dHVyZS4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBEbyB3ZSB3YW50IHRvIGUuZyBoYXZpbmcg
YSBnZW5lcmljIHZob3N0IG1kZXYgZm9yIGFsbCBraW5kcyBvZiAKPj4+Pj4+Pj4+IGRldmljZXMg
b3IKPj4+Pj4+Pj4+IGludHJvZHVjaW5nIGUuZyB2aG9zdC1uZXQtbWRldiBhbmQgdmhvc3Qtc2Nz
aS1tZGV2Pwo+Pj4+Pj4+PiBPbmUgcG9zc2libGUgd2F5IGlzIHRvIGRvIHdoYXQgdmhvc3QtdXNl
ciBkb2VzLiBJLmUuIEFwYXJ0IGZyb20KPj4+Pj4+Pj4gdGhlIGdlbmVyaWMgcmluZywgZmVhdHVy
ZXMsIC4uLiByZWxhdGVkIGlvY3Rscywgd2UgYWxzbyBpbnRyb2R1Y2UKPj4+Pj4+Pj4gZGV2aWNl
IHNwZWNpZmljIGlvY3RscyB3aGVuIHdlIG5lZWQgdGhlbS4gQXMgdmhvc3QtbWRldiBqdXN0IG5l
ZWRzCj4+Pj4+Pj4+IHRvIGZvcndhcmQgY29uZmlncyBiZXR3ZWVuIHBhcmVudCBhbmQgdXNlcnNw
YWNlIGFuZCBldmVuIHdvbid0Cj4+Pj4+Pj4+IGNhY2hlIGFueSBpbmZvIHdoZW4gcG9zc2libGUs
Cj4+Pj4+Pj4gU28gaXQgbG9va3MgdG8gbWUgdGhpcyBpcyBvbmx5IHBvc3NpYmxlIGlmIHdlIGV4
cG9zZSBlLmcgCj4+Pj4+Pj4gc2V0X2NvbmZpZyBhbmQKPj4+Pj4+PiBnZXRfY29uZmlnIHRvIHVz
ZXJzcGFjZS4KPj4+Pj4+IFRoZSBzZXRfY29uZmlnIGFuZCBnZXRfY29uZmlnIGludGVyZmFjZSBp
c24ndCByZWFsbHkgZXZlcnl0aGluZwo+Pj4+Pj4gb2YgZGV2aWNlIHNwZWNpZmljIHNldHRpbmdz
LiBXZSBhbHNvIGhhdmUgY3RybHEgaW4gdmlydGlvLW5ldC4KPj4+Pj4gWWVzLCBidXQgaXQgY291
bGQgYmUgcHJvY2Vzc2VkIGJ5IHRoZSBleGlzdCBBUEkuIElzbid0IGl0PyBKdXN0IAo+Pj4+PiBz
ZXQgY3RybCB2cQo+Pj4+PiBhZGRyZXNzIGFuZCBsZXQgcGFyZW50IHRvIGRlYWwgd2l0aCB0aGF0
Lgo+Pj4+IEkgbWVhbiBob3cgdG8gZXhwb3NlIGN0cmxxIHJlbGF0ZWQgc2V0dGluZ3MgdG8gdXNl
cnNwYWNlPwo+Pj4KPj4+IEkgdGhpbmsgaXQgd29ya3MgbGlrZToKPj4+Cj4+PiAxKSB1c2Vyc3Bh
Y2UgZmluZCBjdHJsX3ZxIGlzIHN1cHBvcnRlZAo+Pj4KPj4+IDIpIHRoZW4gaXQgY2FuIGFsbG9j
YXRlIG1lbW9yeSBmb3IgY3RybCB2cSBhbmQgc2V0IGl0cyBhZGRyZXNzIHRocm91Z2gKPj4+IHZo
b3N0LW1kZXYKPj4+Cj4+PiAzKSB1c2Vyc3BhY2UgY2FuIHBvcHVsYXRlIGN0cmwgdnEgaXRzZWxm
Cj4+IEkgc2VlLiBUaGF0IGlzIHRvIHNheSwgdXNlcnNwYWNlIGUuZy4gUUVNVSB3aWxsIHByb2dy
YW0gdGhlCj4+IGN0cmwgdnEgd2l0aCB0aGUgZXhpc3RpbmcgVkhPU1RfKl9WUklOR18qIGlvY3Rs
cywgYW5kIHBhcmVudAo+PiBkcml2ZXJzIHNob3VsZCBrbm93IHRoYXQgdGhlIGFkZHJlc3NlcyB1
c2VkIGluIGN0cmwgdnEgYXJlCj4+IGhvc3QgdmlydHVhbCBhZGRyZXNzZXMgaW4gdmhvc3QtbWRl
didzIGNhc2UuCj4KPgo+IFRoYXQncyByZWFsbHkgZ29vZCBwb2ludC4gQW5kIHRoYXQgbWVhbnMg
cGFyZW50IG5lZWRzIHRvIGRpZmZlciB2aG9zdCAKPiBmcm9tIHZpcnRpby4gSXQgc2hvdWxkIHdv
cmsuIAoKCkhWQSBtYXkgb25seSB3b3JrIHdoZW4gd2UgaGF2ZSBzb21ldGhpbmcgc2ltaWxhciB0
byBWSE9TVF9TRVRfT1dORVIgCndoaWNoIGNhbiByZXVzZSBNTSBvZiBpdHMgb3duZXIuCgoKPiBC
dXQgaXMgdGhlcmUgYW55IGNoYW5jZSB0byB1c2UgRE1BIGFkZHJlc3M/IEknbSBhc2tpbmcgc2lu
Y2UgdGhlIEFQSSAKPiB0aGVuIHRlbmRzIHRvIGJlIGRldmljZSBzcGVjaWZpYy4gCgoKSSB3b25k
ZXIgd2hldGhlciB3ZSBjYW4gaW50cm9kdWNlIE1BUCBJT01NVSBub3RpZmllciBhbmQgZ2V0IERN
QSAKbWFwcGluZ3MgZnJvbSB0aGF0LgoKVGhhbmtzCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVh
bGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZv
dW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
