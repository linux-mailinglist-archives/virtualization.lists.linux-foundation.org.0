Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D1B144BC9
	for <lists.virtualization@lfdr.de>; Wed, 22 Jan 2020 07:36:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9AF52810BE;
	Wed, 22 Jan 2020 06:36:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JE1HZbZdGatu; Wed, 22 Jan 2020 06:36:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id ED7A885F87;
	Wed, 22 Jan 2020 06:36:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D2BC3C0174;
	Wed, 22 Jan 2020 06:36:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4F6C6C0174
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jan 2020 06:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 33DD720774
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jan 2020 06:36:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QWH5bsn38-6O
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jan 2020 06:36:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 23EA62042B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jan 2020 06:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579674994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1AgtjhKHd4/5av8ia9uDpc8Nq+RQASbmRf/YcZZFxw0=;
 b=QYJXMx2YSaxyYhDL6QAe2rLHrxcOmYZyfQNnz9WbczYnVWu+ZcWAIRSnHXui2pwRovAf0Y
 1L1TOOLqftjlJndi+fCEuy5mVyAIYCFiEjL0LxRF4Sj+s1p0fruttDaaeb1vtWZaTxnInl
 gWTX51D8+/0pqIVSr27xwILKNekjckA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-BXbVLD1vPGycxmPEZeguXQ-1; Wed, 22 Jan 2020 01:36:33 -0500
X-MC-Unique: BXbVLD1vPGycxmPEZeguXQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 305F11005502;
 Wed, 22 Jan 2020 06:36:30 +0000 (UTC)
Received: from [10.72.12.103] (ovpn-12-103.pek2.redhat.com [10.72.12.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A0F3D60BE0;
 Wed, 22 Jan 2020 06:36:12 +0000 (UTC)
Subject: Re: [PATCH 3/5] vDPA: introduce vDPA bus
To: Shahaf Shuler <shahafs@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>
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
 <028ed448-a948-79d9-f224-c325029b17ab@redhat.com>
 <AM0PR0502MB37956A8D6690B190EEA713A5C30D0@AM0PR0502MB3795.eurprd05.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <d0f5e232-0649-4863-4b8d-13875d1a9e26@redhat.com>
Date: Wed, 22 Jan 2020 14:36:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <AM0PR0502MB37956A8D6690B190EEA713A5C30D0@AM0PR0502MB3795.eurprd05.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "mhabets@solarflare.com" <mhabets@solarflare.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Rob Miller <rob.miller@broadcom.com>, "lulu@redhat.com" <lulu@redhat.com>,
 "hanand@xilinx.com" <hanand@xilinx.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Parav Pandit <parav@mellanox.com>,
 Jiri Pirko <jiri@mellanox.com>, "Wang, Xiao W" <xiao.w.wang@intel.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>, "Wang,
 Zhihong" <zhihong.wang@intel.com>, Netdev <netdev@vger.kernel.org>,
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

Ck9uIDIwMjAvMS8yMSDkuIvljYg3OjA5LCBTaGFoYWYgU2h1bGVyIHdyb3RlOgo+IFR1ZXNkYXks
IEphbnVhcnkgMjEsIDIwMjAgMTA6MzUgQU0sIEphc29uIFdhbmc6Cj4+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggMy81XSB2RFBBOiBpbnRyb2R1Y2UgdkRQQSBidXMKPj4KPj4KPj4gT24gMjAyMC8xLzIx
IOS4i+WNiDQ6MTUsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4+IE9uIFR1ZSwgSmFuIDIx
LCAyMDIwIGF0IDA0OjAwOjM4UE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+Pj4gT24gMjAy
MC8xLzIxIOS4i+WNiDE6NDcsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4+Pj4gT24gVHVl
LCBKYW4gMjEsIDIwMjAgYXQgMTI6MDA6NTdQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4+
Pj4+IE9uIDIwMjAvMS8yMSDkuIrljYgxOjQ5LCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4+Pj4+
Pj4gT24gTW9uLCBKYW4gMjAsIDIwMjAgYXQgMDQ6NDM6NTNQTSArMDgwMCwgSmFzb24gV2FuZyB3
cm90ZToKPj4+Pj4+Pj4gVGhpcyBpcyBzaW1pbGFyIHRvIHRoZSBkZXNpZ24gb2YgcGxhdGZvcm0g
SU9NTVUgcGFydCBvZgo+Pj4+Pj4+PiB2aG9zdC12ZHBhLiBXZSBkZWNpZGUgdG8gc2VuZCBkaWZm
cyB0byBwbGF0Zm9ybSBJT01NVSB0aGVyZS4gSWYKPj4+Pj4+Pj4gaXQncyBvayB0byBkbyB0aGF0
IGluIGRyaXZlciwgd2UgY2FuIHJlcGxhY2Ugc2V0X21hcCB3aXRoIGluY3JlbWVudGFsCj4+IEFQ
SSBsaWtlIG1hcCgpL3VubWFwKCkuCj4+Pj4+Pj4+IFRoZW4gZHJpdmVyIG5lZWQgdG8gbWFpbnRh
aW4gcmJ0cmVlIGl0c2VsZi4KPj4+Pj4+PiBJIHRoaW5rIHdlIHJlYWxseSBuZWVkIHRvIHNlZSB0
d28gbW9kZXMsIG9uZSB3aGVyZSB0aGVyZSBpcyBhCj4+Pj4+Pj4gZml4ZWQgdHJhbnNsYXRpb24g
d2l0aG91dCBkeW5hbWljIHZJT01NVSBkcml2ZW4gY2hhbmdlcyBhbmQgb25lCj4+Pj4+Pj4gdGhh
dCBzdXBwb3J0cyB2SU9NTVUuCj4+Pj4+PiBJIHRoaW5rIGluIHRoaXMgY2FzZSwgeW91IG1lYW50
IHRoZSBtZXRob2QgcHJvcG9zZWQgYnkgU2hhaGFmIHRoYXQKPj4+Pj4+IHNlbmRzIGRpZmZzIG9m
ICJmaXhlZCB0cmFuc2xhdGlvbiIgdG8gZGV2aWNlPwo+Pj4+Pj4KPj4+Pj4+IEl0IHdvdWxkIGJl
IGtpbmQgb2YgdHJpY2t5IHRvIGRlYWwgd2l0aCB0aGUgZm9sbG93aW5nIGNhc2UgZm9yIGV4YW1w
bGU6Cj4+Pj4+Pgo+Pj4+Pj4gb2xkIG1hcCBbNEcsIDE2RykgbmV3IG1hcCBbNEcsIDhHKQo+Pj4+
Pj4KPj4+Pj4+IElmIHdlIGRvCj4+Pj4+Pgo+Pj4+Pj4gMSkgZmx1c2ggWzRHLCAxNkcpCj4+Pj4+
PiAyKSBhZGQgWzRHLCA4RykKPj4+Pj4+Cj4+Pj4+PiBUaGVyZSBjb3VsZCBiZSBhIHdpbmRvdyBi
ZXR3ZWVuIDEpIGFuZCAyKS4KPj4+Pj4+Cj4+Pj4+PiBJdCByZXF1aXJlcyB0aGUgSU9NTVUgdGhh
dCBjYW4gZG8KPj4+Pj4+Cj4+Pj4+PiAxKSByZW1vdmUgWzhHLCAxNkcpCj4+Pj4+PiAyKSBmbHVz
aCBbOEcsIDE2RykKPj4+Pj4+IDMpIGNoYW5nZSBbNEcsIDhHKQo+Pj4+Pj4KPj4+Pj4+IC4uLi4K
Pj4+Pj4gQmFzaWNhbGx5IHdoYXQgSSBoYWQgaW4gbWluZCBpcyBzb21ldGhpbmcgbGlrZSBxZW11
IG1lbW9yeSBhcGkKPj4+Pj4KPj4+Pj4gMC4gYmVnaW4KPj4+Pj4gMS4gcmVtb3ZlIFs4RywgMTZH
KQo+Pj4+PiAyLiBhZGQgWzRHLCA4RykKPj4+Pj4gMy4gY29tbWl0Cj4+Pj4gVGhpcyBzb3VuZHMg
bW9yZSBmbGV4aWJsZSBlLmcgZHJpdmVyIG1heSBjaG9vc2UgdG8gaW1wbGVtZW50IHN0YXRpYwo+
Pj4+IG1hcHBpbmcgb25lIHRocm91Z2ggY29tbWl0LiBCdXQgYSBxdWVzdGlvbiBoZXJlLCBpdCBs
b29rcyB0byBtZSB0aGlzCj4+Pj4gc3RpbGwgcmVxdWlyZXMgdGhlIERNQSB0byBiZSBzeW5jZWQg
d2l0aCBhdCBsZWFzdCBjb21taXQgaGVyZS4KPj4+PiBPdGhlcndpc2UgZGV2aWNlIG1heSBnZXQg
RE1BIGZhdWx0PyBPciBkZXZpY2UgaXMgZXhwZWN0ZWQgdG8gYmUgcGF1c2VkCj4+IERNQSBkdXJp
bmcgYmVnaW4/Cj4+Pj4gVGhhbmtzCj4+PiBGb3IgZXhhbXBsZSwgY29tbWl0IG1pZ2h0IHN3aXRj
aCBvbmUgc2V0IG9mIHRhYmxlcyBmb3IgYW5vdGhlciwKPj4+IHdpdGhvdXQgbmVlZCB0byBwYXVz
ZSBETUEuCj4+IFllcywgSSB0aGluayB0aGF0IHdvcmtzIGJ1dCBuZWVkIGNvbmZpcm1hdGlvbiBm
cm9tIFNoYWhhZiBvciBKYXNvbi4KPiAgRnJvbSBteSBzaWRlLCBhcyBJIHdyb3RlLCBJIHdvdWxk
IGxpa2UgdG8gc2VlIHRoZSBzdWdnZXN0ZWQgZnVuY3Rpb24gcHJvdG90eXBlIGFsb25nIHcvIHRo
ZSBkZWZpbml0aW9uIG9mIHRoZSBleHBlY3RhdGlvbiBmcm9tIGRyaXZlciB1cG9uIGNhbGxpbmcg
dGhvc2UuCj4gSXQgaXMgbm90IDEwMCUgY2xlYXIgdG8gbWUgd2hhdCBzaG91bGQgYmUgdGhlIG91
dGNvbWUgb2YgcmVtb3ZlL2ZsdXNoL2NoYW5nZS9jb21taXQKCgpSaWdodCwgSSBjYW4gZG8gdGhp
cyBpbiBuZXh0IHZlcnNpb24gYWZ0ZXIgdGhlIGRpc2N1c3Npb24gaXMgY29udmVyZ2VkLgoKVGhh
bmtzCgoKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
VmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3ZpcnR1YWxpemF0aW9u
