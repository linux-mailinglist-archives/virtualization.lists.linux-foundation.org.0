Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBE314385E
	for <lists.virtualization@lfdr.de>; Tue, 21 Jan 2020 09:36:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A5593204DD;
	Tue, 21 Jan 2020 08:36:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LSk9MfzZXJ0j; Tue, 21 Jan 2020 08:36:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 722EE204D0;
	Tue, 21 Jan 2020 08:36:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4AE51C0174;
	Tue, 21 Jan 2020 08:36:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2BCCC0174
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 08:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D302C87A15
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 08:36:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6-A6vJL+ny41
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 08:35:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E83DF879C5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 08:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579595751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N7dpAEkIwYs7qlTREqwW6WdsBkWtgFDA0vfOaVMiY7c=;
 b=J90SFnPaoC+Z+0CeBym/O2aFOCBXsUpeCj1zzkIyd7cWux3LPvCrr0ELxh0YCXvD/Q8cnM
 y823NBaHy0e/4Cn611n/Lm95m2CxKztLoYFaWwS8myKK1EFU9+1J8oGAyoRKdxNCVgfEBL
 Hj/z6GdsN2gyUlvxoBfNGXTxA57cvsU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-bBs492L5PM6Oe7SbmYwpXw-1; Tue, 21 Jan 2020 03:35:50 -0500
X-MC-Unique: bBs492L5PM6Oe7SbmYwpXw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80F95107ACC4;
 Tue, 21 Jan 2020 08:35:47 +0000 (UTC)
Received: from [10.72.12.103] (ovpn-12-103.pek2.redhat.com [10.72.12.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0429F63148;
 Tue, 21 Jan 2020 08:35:28 +0000 (UTC)
Subject: Re: [PATCH 3/5] vDPA: introduce vDPA bus
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200116124231.20253-4-jasowang@redhat.com>
 <20200117070324-mutt-send-email-mst@kernel.org>
 <239b042c-2d9e-0eec-a1ef-b03b7e2c5419@redhat.com>
 <CAJPjb1+fG9L3=iKbV4Vn13VwaeDZZdcfBPvarogF_Nzhk+FnKg@mail.gmail.com>
 <AM0PR0502MB379553984D0D55FDE25426F6C3330@AM0PR0502MB3795.eurprd05.prod.outlook.com>
 <d69918ca-8af4-44b2-9652-633530d4c113@redhat.com>
 <20200120174933.GB3891@mellanox.com>
 <2a324cec-2863-58f4-c58a-2414ee32c930@redhat.com>
 <20200121004047-mutt-send-email-mst@kernel.org>
 <b9ad744e-c4cd-82f9-f56a-1ecc185e9cd7@redhat.com>
 <20200121031506-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <028ed448-a948-79d9-f224-c325029b17ab@redhat.com>
Date: Tue, 21 Jan 2020 16:35:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200121031506-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "mhabets@solarflare.com" <mhabets@solarflare.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Rob Miller <rob.miller@broadcom.com>, "lulu@redhat.com" <lulu@redhat.com>,
 "hanand@xilinx.com" <hanand@xilinx.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Shahaf Shuler <shahafs@mellanox.com>,
 Parav Pandit <parav@mellanox.com>, Jiri Pirko <jiri@mellanox.com>, "Wang,
 Xiao W" <xiao.w.wang@intel.com>, "stefanha@redhat.com" <stefanha@redhat.com>,
 "Wang, Zhihong" <zhihong.wang@intel.com>, Netdev <netdev@vger.kernel.org>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>, "Zhu,
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Ck9uIDIwMjAvMS8yMSDkuIvljYg0OjE1LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
VHVlLCBKYW4gMjEsIDIwMjAgYXQgMDQ6MDA6MzhQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gT24gMjAyMC8xLzIxIOS4i+WNiDE6NDcsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4+
IE9uIFR1ZSwgSmFuIDIxLCAyMDIwIGF0IDEyOjAwOjU3UE0gKzA4MDAsIEphc29uIFdhbmcgd3Jv
dGU6Cj4+Pj4gT24gMjAyMC8xLzIxIOS4iuWNiDE6NDksIEphc29uIEd1bnRob3JwZSB3cm90ZToK
Pj4+Pj4gT24gTW9uLCBKYW4gMjAsIDIwMjAgYXQgMDQ6NDM6NTNQTSArMDgwMCwgSmFzb24gV2Fu
ZyB3cm90ZToKPj4+Pj4+IFRoaXMgaXMgc2ltaWxhciB0byB0aGUgZGVzaWduIG9mIHBsYXRmb3Jt
IElPTU1VIHBhcnQgb2Ygdmhvc3QtdmRwYS4gV2UKPj4+Pj4+IGRlY2lkZSB0byBzZW5kIGRpZmZz
IHRvIHBsYXRmb3JtIElPTU1VIHRoZXJlLiBJZiBpdCdzIG9rIHRvIGRvIHRoYXQgaW4KPj4+Pj4+
IGRyaXZlciwgd2UgY2FuIHJlcGxhY2Ugc2V0X21hcCB3aXRoIGluY3JlbWVudGFsIEFQSSBsaWtl
IG1hcCgpL3VubWFwKCkuCj4+Pj4+Pgo+Pj4+Pj4gVGhlbiBkcml2ZXIgbmVlZCB0byBtYWludGFp
biByYnRyZWUgaXRzZWxmLgo+Pj4+PiBJIHRoaW5rIHdlIHJlYWxseSBuZWVkIHRvIHNlZSB0d28g
bW9kZXMsIG9uZSB3aGVyZSB0aGVyZSBpcyBhIGZpeGVkCj4+Pj4+IHRyYW5zbGF0aW9uIHdpdGhv
dXQgZHluYW1pYyB2SU9NTVUgZHJpdmVuIGNoYW5nZXMgYW5kIG9uZSB0aGF0Cj4+Pj4+IHN1cHBv
cnRzIHZJT01NVS4KPj4+PiBJIHRoaW5rIGluIHRoaXMgY2FzZSwgeW91IG1lYW50IHRoZSBtZXRo
b2QgcHJvcG9zZWQgYnkgU2hhaGFmIHRoYXQgc2VuZHMKPj4+PiBkaWZmcyBvZiAiZml4ZWQgdHJh
bnNsYXRpb24iIHRvIGRldmljZT8KPj4+Pgo+Pj4+IEl0IHdvdWxkIGJlIGtpbmQgb2YgdHJpY2t5
IHRvIGRlYWwgd2l0aCB0aGUgZm9sbG93aW5nIGNhc2UgZm9yIGV4YW1wbGU6Cj4+Pj4KPj4+PiBv
bGQgbWFwIFs0RywgMTZHKSBuZXcgbWFwIFs0RywgOEcpCj4+Pj4KPj4+PiBJZiB3ZSBkbwo+Pj4+
Cj4+Pj4gMSkgZmx1c2ggWzRHLCAxNkcpCj4+Pj4gMikgYWRkIFs0RywgOEcpCj4+Pj4KPj4+PiBU
aGVyZSBjb3VsZCBiZSBhIHdpbmRvdyBiZXR3ZWVuIDEpIGFuZCAyKS4KPj4+Pgo+Pj4+IEl0IHJl
cXVpcmVzIHRoZSBJT01NVSB0aGF0IGNhbiBkbwo+Pj4+Cj4+Pj4gMSkgcmVtb3ZlIFs4RywgMTZH
KQo+Pj4+IDIpIGZsdXNoIFs4RywgMTZHKQo+Pj4+IDMpIGNoYW5nZSBbNEcsIDhHKQo+Pj4+Cj4+
Pj4gLi4uLgo+Pj4gQmFzaWNhbGx5IHdoYXQgSSBoYWQgaW4gbWluZCBpcyBzb21ldGhpbmcgbGlr
ZSBxZW11IG1lbW9yeSBhcGkKPj4+Cj4+PiAwLiBiZWdpbgo+Pj4gMS4gcmVtb3ZlIFs4RywgMTZH
KQo+Pj4gMi4gYWRkIFs0RywgOEcpCj4+PiAzLiBjb21taXQKPj4KPj4gVGhpcyBzb3VuZHMgbW9y
ZSBmbGV4aWJsZSBlLmcgZHJpdmVyIG1heSBjaG9vc2UgdG8gaW1wbGVtZW50IHN0YXRpYyBtYXBw
aW5nCj4+IG9uZSB0aHJvdWdoIGNvbW1pdC4gQnV0IGEgcXVlc3Rpb24gaGVyZSwgaXQgbG9va3Mg
dG8gbWUgdGhpcyBzdGlsbCByZXF1aXJlcwo+PiB0aGUgRE1BIHRvIGJlIHN5bmNlZCB3aXRoIGF0
IGxlYXN0IGNvbW1pdCBoZXJlLiBPdGhlcndpc2UgZGV2aWNlIG1heSBnZXQgRE1BCj4+IGZhdWx0
PyBPciBkZXZpY2UgaXMgZXhwZWN0ZWQgdG8gYmUgcGF1c2VkIERNQSBkdXJpbmcgYmVnaW4/Cj4+
Cj4+IFRoYW5rcwo+IEZvciBleGFtcGxlLCBjb21taXQgbWlnaHQgc3dpdGNoIG9uZSBzZXQgb2Yg
dGFibGVzIGZvciBhbm90aGVyLAo+IHdpdGhvdXQgbmVlZCB0byBwYXVzZSBETUEuCgoKWWVzLCBJ
IHRoaW5rIHRoYXQgd29ya3MgYnV0IG5lZWQgY29uZmlybWF0aW9uIGZyb20gU2hhaGFmIG9yIEph
c29uLgoKVGhhbmtzCgoKCj4KPj4+IEFueXdheSwgSSdtIGZpbmUgd2l0aCBhIG9uZS1zaG90IEFQ
SSBmb3Igbm93LCB3ZSBjYW4KPj4+IGltcHJvdmUgaXQgbGF0ZXIuCj4+Pgo+Pj4+PiBUaGVyZSBh
cmUgZGlmZmVyZW50IG9wdGltaXphdGlvbiBnb2FscyBpbiB0aGUgZHJpdmVycyBmb3IgdGhlc2Ug
dHdvCj4+Pj4+IGNvbmZpZ3VyYXRpb25zLgo+Pj4+Pgo+Pj4+Pj4+IElmIHRoZSBmaXJzdCBvbmUs
IHRoZW4gSSB0aGluayBtZW1vcnkgaG90cGx1ZyBpcyBhIGhlYXZ5IGZsb3cKPj4+Pj4+PiByZWdh
cmRsZXNzLiBEbyB5b3UgdGhpbmsgdGhlIGV4dHJhIGN5Y2xlcyBmb3IgdGhlIHRyZWUgdHJhdmVy
c2UKPj4+Pj4+PiB3aWxsIGJlIHZpc2libGUgaW4gYW55IHdheT8KPj4+Pj4+IEkgdGhpbmsgaWYg
dGhlIGRyaXZlciBjYW4gcGF1c2UgdGhlIERNQSBkdXJpbmcgdGhlIHRpbWUgZm9yIHNldHRpbmcg
dXAgbmV3Cj4+Pj4+PiBtYXBwaW5nLCBpdCBzaG91bGQgYmUgZmluZS4KPj4+Pj4gVGhpcyBpcyB2
ZXJ5IHRyaWNreSBmb3IgYW55IGRyaXZlciBpZiB0aGUgbWFwcGluZyBjaGFuZ2UgaGl0cyB0aGUK
Pj4+Pj4gdmlydGlvIHJpbmdzLiA6KAo+Pj4+Pgo+Pj4+PiBFdmVuIGEgSU9NTVUgdXNpbmcgZHJp
dmVyIGlzIGdvaW5nIHRvIGhhdmUgcHJvYmxlbXMgd2l0aCB0aGF0Li4KPj4+Pj4KPj4+Pj4gSmFz
b24KPj4+PiBPciBJIHdvbmRlciB3aGV0aGVyIEFUUy9QUkkgY2FuIGhlbHAgaGVyZS4gRS5nIGR1
cmluZyBJL08gcGFnZSBmYXVsdCwKPj4+PiBkcml2ZXIvZGV2aWNlIGNhbiB3YWl0IGZvciB0aGUg
bmV3IG1hcHBpbmcgdG8gYmUgc2V0IGFuZCB0aGVuIHJlcGxheSB0aGUKPj4+PiBETUEuCj4+Pj4K
Pj4+PiBUaGFua3MKPj4+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3Rz
LmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
