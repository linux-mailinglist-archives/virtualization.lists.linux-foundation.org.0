Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 218FA719174
	for <lists.virtualization@lfdr.de>; Thu,  1 Jun 2023 05:41:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B3F1424C7;
	Thu,  1 Jun 2023 03:41:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B3F1424C7
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GPFrF/gN
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j66PWl14lPYN; Thu,  1 Jun 2023 03:41:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 4E135424C6;
	Thu,  1 Jun 2023 03:41:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E135424C6
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 86FE9C008C;
	Thu,  1 Jun 2023 03:41:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BB4C1C0037
 for <virtualization@lists.linux-foundation.org>;
 Thu,  1 Jun 2023 03:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1CDD40181
 for <virtualization@lists.linux-foundation.org>;
 Thu,  1 Jun 2023 03:41:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1CDD40181
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=GPFrF/gN
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vSyziQD8fCe7
 for <virtualization@lists.linux-foundation.org>;
 Thu,  1 Jun 2023 03:41:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C910F4015A
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C910F4015A
 for <virtualization@lists.linux-foundation.org>;
 Thu,  1 Jun 2023 03:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685590867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7v5kuFeKdd0FbY1t+cfVsvYVz22RqAFpoIgWaiWaDmw=;
 b=GPFrF/gNTVxIVp1mNNJd0deZadwzD79+QxTUuWU67J3FtsbW9l+h8FmZUj8LXwFrXb8N/8
 tR7S5llO54/R1zfHSlfR/FMuC0z6tr2rFOsO/6CV1M13n92+GI/ceTPPEbv5e1+lvZOWjm
 lN2bZK5lv8YTxwjPwaRsgjudUG60lYk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-vKmbvoXbPq2tSQjBnH3RXA-1; Wed, 31 May 2023 23:40:17 -0400
X-MC-Unique: vKmbvoXbPq2tSQjBnH3RXA-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-30ae9958ff6so241321f8f.1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 31 May 2023 20:40:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685590816; x=1688182816;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7v5kuFeKdd0FbY1t+cfVsvYVz22RqAFpoIgWaiWaDmw=;
 b=K3VAkCj3ouuKZNsiZA0gvsz/exlHqy0Mbdw43YLCNeFKujo1X56qBvy2cj/KSMP623
 VTnl1mix6gDQ+9r+bOqHCOitmtCZ06qgCKRaAzIJhGfMG3qaHBT7gw/5JGcIyFJzKBmG
 4v9NzbN0RfJqHdkgh4aa/OrHA0Kms7qXLlwdUvEeVC/I9VRVjQ5gytUYLAAcml2qz80B
 Pm3H6ngxwJmX1Yuf1Cg0rqvKzWAL88fI6uWRSTZRcxeegA2OiRjDTiLlNlr8W1EV54Bp
 eJvQxlCrGMewI2/LD9FGFIVmkaWv2uqyhMJ+81wxNBqFNkVcZB8/EMugQdtXJbm6cKdk
 /NQg==
X-Gm-Message-State: AC+VfDyPuIL5abjFyPUuigzSqYtPvtF4ObP/oM0tY04VdWGx2u1k15bs
 JYRA55N349v/dCZZsGD9n1tC5MsXyz+tpCtPkE5nWpen4LsYbHim/pM4v0Jnae9NJo3BOUwA/wY
 t5k+Cnm3X/1wMLsYabR24jEacRtYNofTkKr5wrNd+2g==
X-Received: by 2002:adf:ef10:0:b0:2f9:ee8c:a2fa with SMTP id
 e16-20020adfef10000000b002f9ee8ca2famr652482wro.64.1685590816036; 
 Wed, 31 May 2023 20:40:16 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6GjT+wjNUUjRw2icdmfT7+gkcuBv7GhnOk8Vv9EbIqy1CJmU7O0vcgPJVlIJfhx38YJs7NPw==
X-Received: by 2002:adf:ef10:0:b0:2f9:ee8c:a2fa with SMTP id
 e16-20020adfef10000000b002f9ee8ca2famr652472wro.64.1685590815593; 
 Wed, 31 May 2023 20:40:15 -0700 (PDT)
Received: from redhat.com ([2.52.143.63]) by smtp.gmail.com with ESMTPSA id
 n13-20020adfe78d000000b003078681a1e8sm8628687wrm.54.2023.05.31.20.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 20:40:14 -0700 (PDT)
Date: Wed, 31 May 2023 23:40:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] virtio_ring: validate used buffer length
Message-ID: <20230531233454-mutt-send-email-mst@kernel.org>
References: <20230526063041.18359-1-jasowang@redhat.com>
 <20230528033037-mutt-send-email-mst@kernel.org>
 <CACGkMEs9Ztavn2JyuUAb47Sk1fYHiXLLkQQPQR5Czhb2yu_R3w@mail.gmail.com>
 <20230529055729-mutt-send-email-mst@kernel.org>
 <CACGkMEsW1+BFtMoLg4c_FyxYTZJcSVh4BoEdJ-Q9_WGg_DcReA@mail.gmail.com>
 <20230531014326-mutt-send-email-mst@kernel.org>
 <CACGkMEvok6HjBK_ZMR4EYzWxpJQVeh++EMErnHjJ6cu9m3R-1A@mail.gmail.com>
 <CACGkMEuDWL30J7D8v+xLCvvspRBoz8X7q23FymBVRm9bT1pVUQ@mail.gmail.com>
 <20230531062108-mutt-send-email-mst@kernel.org>
 <CACGkMEvE=e1tRFScbzija=oUMqznqMDs7jQKCie9ya1NehwnVA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEvE=e1tRFScbzija=oUMqznqMDs7jQKCie9ya1NehwnVA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: xuanzhuo@linux.alibaba.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gVGh1LCBKdW4gMDEsIDIwMjMgYXQgMDk6Mjc6MDhBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiBPbiBXZWQsIE1heSAzMSwgMjAyMyBhdCA2OjI14oCvUE0gTWljaGFlbCBTLiBUc2lya2lu
IDxtc3RAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gV2VkLCBNYXkgMzEsIDIwMjMgYXQg
MDQ6MjY6MzhQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPiA+ID4gT24gV2VkLCBNYXkgMzEs
IDIwMjMgYXQgMzozNuKAr1BNIEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+IHdyb3Rl
Ogo+ID4gPiA+Cj4gPiA+ID4gT24gV2VkLCBNYXkgMzEsIDIwMjMgYXQgMTo1MOKAr1BNIE1pY2hh
ZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+
IE9uIFdlZCwgTWF5IDMxLCAyMDIzIGF0IDA5OjA1OjAwQU0gKzA4MDAsIEphc29uIFdhbmcgd3Jv
dGU6Cj4gPiA+ID4gPiA+IE9uIE1vbiwgTWF5IDI5LCAyMDIzIGF0IDY6MDPigK9QTSBNaWNoYWVs
IFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPiB3cm90ZToKPiA+ID4gPiA+ID4gPgo+ID4gPiA+
ID4gPiA+IE9uIE1vbiwgTWF5IDI5LCAyMDIzIGF0IDA5OjE4OjEwQU0gKzA4MDAsIEphc29uIFdh
bmcgd3JvdGU6Cj4gPiA+ID4gPiA+ID4gPiBPbiBTdW4sIE1heSAyOCwgMjAyMyBhdCAzOjU34oCv
UE0gTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+IE9uIEZyaSwgTWF5IDI2LCAyMDIzIGF0IDAyOjMwOjQx
UE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4gPiA+ID4gPiA+ID4gPiA+ID4gVGhpcyBwYXRj
aCB2YWxpZGF0ZQo+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiB2YWxpZGF0ZXMK
PiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gPiB0aGUgdXNlZCBidWZmZXIgbGVu
Z3RoIHByb3ZpZGVkIGJ5IHRoZSBkZXZpY2UKPiA+ID4gPiA+ID4gPiA+ID4gPiBiZWZvcmUgdHJ5
aW5nIHRvIHVzZSBpdC4KPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gYmVmb3Jl
IHJldHVybmluZyBpdCB0byBjYWxsZXIKPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+
ID4gPiBUaGlzIGlzIGRvbmUgYnkgcmVtZW1iZXJpbmcgdGhlIGluIGJ1ZmZlcgo+ID4gPiA+ID4g
PiA+ID4gPiA+IGxlbmd0aCBpbiBhIGRlZGljYXRlZCBhcnJheSBkdXJpbmcgdmlydHF1ZXVlX2Fk
ZCgpLCB0aGVuIHdlIGNhbiBmYWlsCj4gPiA+ID4gPiA+ID4gPiA+ID4gdGhlIHZpcnRxdWV1ZV9n
ZXRfYnVmKCkgd2hlbiB3ZSBmaW5kIHRoZSBkZXZpY2UgaXMgdHJ5aW5nIHRvIGdpdmUgdXMgYQo+
ID4gPiA+ID4gPiA+ID4gPiA+IHVzZWQgYnVmZmVyIGxlbmd0aCB3aGljaCBpcyBncmVhdGVyIHRo
YW4gd2Ugc3RvcmVkIGJlZm9yZS4KPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4g
dGhhbiB3aGF0IHdlIHN0b3JlZAo+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiA+
Cj4gPiA+ID4gPiA+ID4gPiA+ID4gVGhpcyB2YWxpZGF0aW9uIGlzIGRpc2FibGUKPiA+ID4gPiA+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gZGlzYWJsZWQKPiA+ID4gPiA+ID4gPiA+ID4KPiA+
ID4gPiA+ID4gPiA+ID4gPiBieSBkZWZhdWx0IHZpYSBtb2R1bGUgcGFyYW1ldGVyIHRvIHVuYnJl
YWsKPiA+ID4gPiA+ID4gPiA+ID4gPiBzb21lIGV4aXN0aW5nIGRldmljZXMgc2luY2Ugc29tZSBs
ZWdhY3kgZGV2aWNlcyBhcmUga25vd24gdG8gcmVwb3J0Cj4gPiA+ID4gPiA+ID4gPiA+ID4gYnVn
Z3kgdXNlZCBsZW5ndGguCj4gPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+ID4gPiA+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiBGaXJzdCBJJ20gbm90IG1lcmdpbmcgdGhpcyB3aXRo
b3V0IG1vcmUgZGF0YSBhYm91dAo+ID4gPiA+ID4gPiA+ID4gPiB3aGF0IGlzIGtub3duIHRvIGJl
IGJyb2tlbiBhbmQgd2hhdCBpcyBrbm93biB0byB3b3JrIHdlbGwKPiA+ID4gPiA+ID4gPiA+ID4g
aW4gdGhlIGNvbW1pdCBsb2cuIEFuZCBob3cgZXhhY3RseSBkbyB0aGluZ3Mgd29yayBpZiB1c2Vk
IGxlbmd0aAo+ID4gPiA+ID4gPiA+ID4gPiBpcyB3cm9uZz8KPiA+ID4gPiA+ID4gPiA+Cj4gPiA+
ID4gPiA+ID4gPiBBc3N1bWluZyB0aGUgZGV2aWNlIGlzIG1hbGljaW91cywgaXQgd291bGQgYmUg
dmVyeSBoYXJkIHRvIGFuc3dlci4KPiA+ID4gPiA+ID4gPiA+IEF1ZGl0aW5nIGFuZCBmdXp6aW5n
IHdvbid0IGNvdmVyIGV2ZXJ5IGNhc2UuIEluc3RlYWQgb2YgdHJ5aW5nIHRvIHNlZWsKPiA+ID4g
PiA+ID4gPiA+IHRoZSBhbnN3ZXIsIHdlIGNhbiBzaW1wbHkgbWFrZSBzdXJlIHRoZSB1c2VkIGlu
IGJ1ZmZlciBsZW5ndGggaXMKPiA+ID4gPiA+ID4gPiA+IHZhbGlkYXRlZCB0aGVuIHdlIGtub3cg
d2UncmUgZmluZSBvciBub3QuCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBUbyByZXN0YXRl
IHRoZSBxdWVzdGlvbiwgeW91IHNhaWQgYWJvdmUgInNvbWUgbGVnYWN5IGRldmljZXMgYXJlIGtu
b3duCj4gPiA+ID4gPiA+ID4gdG8gcmVwb3J0IGJ1Z2d5IHVzZWQgbGVuZ3RoIi4gSWYgdGhleSBy
ZXBvcnQgYnVnZ3kgbGVuZ3RoIHRoZW4gaG93Cj4gPiA+ID4gPiA+ID4gY2FuIHRoaW5ncyB3b3Jr
Pwo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBUaGUgdmFsaWRhdGlvbiBpcyBkaXNhYmxlZCBmb3Ig
bGVnYWN5IGRldmljZSAoYXMgc3RhdGVkIGluIHRoZSBjaGFuZ2Vsb2cpOgo+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiBzdGF0aWMgYm9vbCB2cmluZ19uZWVkc191c2VkX3ZhbGlkYXRpb24oY29uc3Qg
c3RydWN0IHZpcnRpb19kZXZpY2UgKnZkZXYpCj4gPiA+ID4gPiA+IHsKPiA+ID4gPiA+ID4gICAg
ICAgICAvKgo+ID4gPiA+ID4gPiAgICAgICAgICAqIFNldmVyYWwgbGVnYWN5IGRldmljZXMgYXJl
IGtub3duIHRvIHByb2R1Y2UgYnVnZ3kgdXNlZAo+ID4gPiA+ID4gPiAgICAgICAgICAqIGxlbmd0
aC4gSW4gb3JkZXIgdG8gbGV0IGRyaXZlciB3b3JrLCB3ZSB3b24ndCB2YWxpZGF0ZSB1c2VkCj4g
PiA+ID4gPiA+ICAgICAgICAgICogYnVmZmVyIGxlbmd0aCBpbiB0aGlzIGNhc2UuCj4gPiA+ID4g
PiA+ICAgICAgICAgICovCj4gPiA+ID4gPiA+ICAgICAgICAgaWYgKCF2aXJ0aW9faGFzX2ZlYXR1
cmUodmRldiwgVklSVElPX0ZfVkVSU0lPTl8xKSkKPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAg
IHJldHVybiBmYWxzZTsKPiA+ID4gPiA+ID4gICAgICAgICBpZiAoZm9yY2VfdXNlZF92YWxpZGF0
aW9uKQo+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIHRydWU7Cj4gPiA+ID4gPiA+
ICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ID4gPiA+ID4gPiB9Cj4gPiA+ID4gPiA+Cj4gPiA+ID4g
PiA+IFRoaXMgc2VlbXMgdG8gYmUgd2hhdCB3ZSd2ZSBhZ3JlZWQgaW4gbGFzdCB2ZXJzaW9uOgo+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvQ0FOTHNZ
a3hmaGFtVVUwYmI0ajd5Nk40X0c5b2RLeExDalh4Z1hFeDRTSjZfS2YrTTJRQG1haWwuZ21haWwu
Y29tL1QvI20zMWYzYjA2ZjkwMzJiZWVjMTc1YzMxMmRmYTI1MzJjYjA4YjE1YzU2Cj4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+IFRoYW5rcwo+ID4gPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+IEkg
ZG9uJ3QgZ2V0IGl0LiBZb3Ugd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gICAgICAgICBUaGlz
IHZhbGlkYXRpb24gaXMgZGlzYWJsZQo+ID4gPiA+ID4gICAgICAgICBieSBkZWZhdWx0IHZpYSBt
b2R1bGUgcGFyYW1ldGVyIHRvIHVuYnJlYWsKPiA+ID4gPiA+ICAgICAgICAgc29tZSBleGlzdGlu
ZyBkZXZpY2VzIHNpbmNlIHNvbWUgbGVnYWN5IGRldmljZXMgYXJlIGtub3duIHRvIHJlcG9ydAo+
ID4gPiA+ID4gICAgICAgICBidWdneSB1c2VkIGxlbmd0aC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiB3
aGljaCBkZXZpY2VzPwo+ID4gPiA+Cj4gPiA+ID4gbGVnYWN5IHJwbXNnIGFuZCB2c29jayBkZXZp
Y2UgKGJlZm9yZSA0OWQ4YzVmZmFkMDcpIGF0IGxlYXN0Lgo+ID4gPiA+Cj4gPiA+ID4gPiB3aHkg
ZG8geW91IG5lZWQgYSBtb2R1bGUgcGFyYW1ldGVyPwo+ID4gPiA+Cj4gPiA+ID4gSWYgd2UgZW5h
YmxlIGl0IHVuY29uZGl0aW9uYWxseSBmb3IgbW9kZXJuIGRldmljZXMsIGl0IG1heSBicmVhayBz
b21lCj4gPiA+ID4gYnVnZ3kgbW9kZW4gZGV2aWNlICh2c29jayB3aXRob3V0IGEgZml4IGFzIGFu
IGV4YW1wbGUpLgo+ID4gPiA+Cj4gPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPgo+ID4g
PiA+ID4gPiA+ID4gPiBTZWNvbmQgd2hhdCdzIHdyb25nIHdpdGggZG1hX2Rlc2NfZXh0cmEgdGhh
dCB3ZSBhbHJlYWR5IG1haW50YWluPwo+ID4gPiA+ID4gPiA+ID4gPiBUaGlyZCBtb3RpdmF0aW9u
IC0gaXQncyBwYXJ0IGFuZCBwYXJjZWwgb2YgdGhlIGhhcmRlbmluZyBlZmZvcnQgeWVzPwo+ID4g
PiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IFRoZXkgYXJlIGRpZmZlcmVudC4gZG1hX2Rlc2Nf
ZXh0cmEgaXMgZm9yIGEgZGVzY3JpcHRvciByaW5nLCBidXQgdGhpcwo+ID4gPiA+ID4gPiA+ID4g
aXMgZm9yIGEgdXNlZCByaW5nLiBUZWNobmljYWxseSB3ZSBjYW4gZ28gYmFjayB0byBpdGVyYXRl
IG9uIHRoZQo+ID4gPiA+ID4gPiA+ID4gZGVzY3JpcHRvciByaW5nIGZvciBhIGxlZ2FsIHVzZWQg
aW4gYnVmZmVyIGxlbmd0aC4gQnV0IGl0IHdpbGwgaGF2ZQo+ID4gPiA+ID4gPiA+ID4gd29yc2Ug
cGVyZm9ybWFuY2UuCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBJIGRvbid0IHJlYWxseSB1
bmRlcnN0YW5kLiBXZSBhbHJlYWR5IGl0ZXJhdGUgd2hlbiB3ZSB1bm1hcCAtCj4gPiA+ID4gPiA+
ID4gYWxsIHRoYXQgaXMgbmVjZXNzYXJ5IGlzIHRvIHN1YnRyYWN0IGl0IGZyb20gdXNlZCBsZW5n
dGgsIGlmIGF0Cj4gPiA+ID4gPiA+ID4gdGhlIGVuZCBvZiB0aGUgcHJvY2VzcyBpdCBpcyA+MCB0
aGVuIHdlIGtub3cgdXNlZCBsZW5ndGggaXMgdG9vCj4gPiA+ID4gPiA+ID4gbGFyZ2UuCj4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+IFllcywgYnV0IGl0IGlzIHRoZSBqb2IgdGhhdCBpcyBkb25lIGlu
IHRoZSBkcml2ZXIgbGV2ZWwgbm90IHRoZSB2aXJ0aW8KPiA+ID4gPiA+ID4gY29yZS4KPiA+ID4g
PiA+Cj4gPiA+ID4gPiBXaGF0IGpvYj8KPiA+ID4gPgo+ID4gPiA+IEkgbWVhbnQgdGhlIGRyaXZl
ciBjYW4gZG8gdGhlIHZhbGlkYXRpb24gc2luY2UgaXQgaGFzIHRoZSBrbm93bGVkZ2Ugb2YKPiA+
ID4gPiB0aGUgYnVmZmVyIGxlbmd0aCBpZiBpdCB3YW50cy4KPiA+ID4gPgo+ID4gPiA+ID4gdW5t
YXAgaXMgZG9uZSBpbiBkZXRhY2hfYnVmX3NwbGl0IGFuZCBkZXRhY2hfYnVmX3BhY2tlZCByZXNw
ZWN0aXZlbHkuCj4gPiA+ID4gPiB2cmluZ19kZXNjX2V4dHJhIGlzbid0IGV2ZW4gdmlzaWJsZSBv
dXRzaWRlIGRyaXZlcnMvdmlydGlvL3ZpcnRpb19yaW5nLmMKPiA+ID4gPgo+ID4gPiA+IGRlc2Nf
ZXh0cmEgZG9lc24ndCBjb250YWluIGJ1ZmZlciBsZW5ndGggZm9yIHRoZSBjYXNlIG9mIGluZGly
ZWN0Cj4gPiA+ID4gZGVzY3JpcHRvcnMuIFNvIHdlIG5lZWQgdG8gaXRlcmF0ZSBpbiB0aGUgZGVz
Y3JpcHRvcnMgd2hlbiBpdCBsb29rcwo+ID4gPiA+IGV4cGVuc2l2ZSBpZiB3ZSBkb24ndCBuZWVk
IHVubWFwLgo+ID4gPiA+Cj4gPiA+ID4gVGhhbmtzCj4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4g
PiBGb3IgZHJpdmVycyB0aGF0IGRvIHVubWFwIGF0IGRyaXZlciBsZXZlbCAtIEkgZ3Vlc3MgdGhl
eSBjYW4gZG8KPiA+ID4gPiA+IHZhbGlkYXRpb24gdGhlcmUgdG9vLgo+ID4gPiA+ID4KPiA+ID4g
PiA+ID4gVmFsaWRhdGlvbiBpbiB2aXJ0aW8gY29yZSBpcyBzdGlsbCBuZWNlc3Nhcnkgc2luY2Ug
dGhleSdyZQo+ID4gPiA+ID4gPiB3b3JraW5nIGF0IGRpZmZlcmVudCBsZXZlbHMgYW5kIGl0J3Mg
aGFyZCB0byBmb3JjZSB0aGUgdmFsaWRhdGlvbiBpbgo+ID4gPiA+ID4gPiBhbGwgZHJpdmVycyBi
eSBjb2Rlcy4gTGFzdCB2ZXJzaW9uIGludHJvZHVjZXMgYQo+ID4gPiA+ID4gPiBzdXBwcmVzc19k
cml2ZXJfdmFsaWRhdGlvbiB0byBhbGxvdyB0aGUgZHJpdmVyIHRvIHN1cHByZXNzIHRoZSBjb3Jl
Cj4gPiA+ID4gPiA+IHZhbGlkYXRpb24gd2hpY2ggc2VlbXMgbm90IGdvb2QsIHdlIG5lZWQgYSB3
YXkgdG8gZm9yY2UgdGhlCj4gPiA+ID4gPiA+IHZpcnRpb19yaW5nIGNvZGUgdG8gZG8gdmFsaWRh
dGlvbiBiZWZvcmUuCj4gPiA+ID4gPgo+ID4gPiA+ID4gV2h5IGRvIHdlPyBJZiBkcml2ZXIgdmFs
aWRhdGVzIGxlbmd0aCB2aXJ0aW9fcmluZyBkb2VzIG5vdCBuZWVkIHRvCj4gPiA+ID4gPiB2YWxp
ZGF0ZS4KPiA+ID4KPiA+ID4gVG8gYmUgbW9yZSBzYWZlLCB0aGVyZSdzIG5vIGd1YXJhbnRlZSB0
aGF0IHRoZXJlJ3Mgbm8gYnVnIGluIHRoZSBkcml2ZXIuCj4gPgo+ID4gRXh0cmEgb3B0aW9ucyBp
bmNyZWFzZSB0ZXN0aW5nIG1hdHJpeCBzaXplIHNvIC0gdGhlcmUgYmUgYnVncy4KPiA+IFdlIG5l
ZWQgdG8gbWFrZSB0aGVzZSBkZWNpc2lvbnMgZm9yIChtb3N0KSB1c2Vycy4KPiAKPiBJbiBzb21l
IGNhc2VzIHRoZSByZXF1aXJlbWVudCBpcyBjb25mbGljdDoKPiAKPiAxKSBmb3IgImxlZ2FjeSB1
c2VycyIsIHRoZSByZXF1aXJlbWVudCBpcyBub3QgdG8gYnJlYWsgZXhpc3Rpbmcgc2V0dXBzCj4g
MikgZm9yIGNvbmZpZGVudGlhbCB1c2VycywgdGhlIHJlcXVpcmVtZW50IGlzIHRvIGRldGVjdCBh
bmQgZmFpbCBlYXJseQo+IGluc3RlYWQgb2YgdHJ5aW5nIHRvIG1pdGlnYXRlIHNpbGVudGx5CgpJ
IHRoaW5rIDIgaXMgYSByZWQgaGVycmluZy4gTm8gb25lIHdhbnRzIHBhbmljcy9mYWlsdXJlcywg
aXQgaXMganVzdAp0b2xlcmF0ZWQgaW4gdGhlIGNvbmZpZGVudGlhbCBzZXR1cC4KCj4gSWYgd2Ug
YXJlIHRyeWluZyB0byBnbyBpbiB0aGUgbWlkZGxlIChmb3IgZXhhbXBsZSwgZG9pbmcgYSBjYXAp
IGl0IG1heQo+IGVuZCB1cCB3aXRoIGEgcmVzdWx0IHRoYXQgY2FuIHNhdGlzZnkgbmVpdGhlcjoK
PiAKPiAxKSBpdCBtaWdodCBzdGlsbCBicmVhayBpbiBzb21lIGRyaXZlcnMgYW5kIHNldHVwcyBs
aWtlIGxlZ2FjeSwgdGhlbgo+IHdlIG5lZWQgYW4gb3B0aW9uIHRvIGRpc2FibGUgaXQKCkkgZG9u
J3Qgc2VlIGhvdyBjYXAgY2FuIGJyZWFrIGFueXRoaW5nLgoKPiAyKSBpdCB3b24ndCBzYXRpc2Z5
IHRoZSB1c2VycyB0aGF0IGFzayBmb3Igc2VjdXJpdHkKPiAKPiBJZiB3ZSBoYWQgYW4gb3B0aW9u
LCB0aGUgbWFuYWdlbWVudCBsYXllciBjYW4gY2hvb3NlIHRvIHByb3Zpc2lvbgo+IFZNL2d1ZXN0
cyB3aXRoIHRoZSBnb29kIGtlcm5lbCBjb21tYW5kIGxpbmUgdGhlbiB3ZSBhcmUgZmluZS4KPiAK
PiA+Cj4gPiA+ID4gIElmIGRyaXZlciBkb2VzIG5vdCB1c2UgbGVuZ3RoIHZpcnRpb19yaW5nIGRv
ZXMgbm90IG5lZWQgdG8KPiA+ID4gPiA+IHZhbGlkYXRlLgo+ID4gPgo+ID4gPiBUaGlzIGNvdWxk
IGJlIGRvbmUgb24gdG9wIGFzc3VtaW5nIHRoZSB2YWxpZGF0aW9uIGlzIGRpc2FibGVkIGJ5Cj4g
PiA+IGRlZmF1bHQuIEJ1dCBpZiB0aGUgYWRtaW5pc3RyYXRvciB3YW50cyB0byBoYXZlIGJlbHQg
YW5kIGJyYWNlcyB3ZQo+ID4gPiBuZWVkIHRvIGxlYXZlIGFuIG9wdGlvbiBmb3IgdGhlbS4KPiA+
ID4KPiA+ID4gVGhhbmtzCj4gPgo+ID4gTm8sIHdlIGRvbid0IHJlZ3Jlc3MgdGhlbiBmaXggb24g
dG9wLgo+IAo+IEknbSBub3Qgc3VyZSBJIHVuZGVyc3RhbmQgaGVyZS4gSXQgd291bGQgYmUgdmVy
eSBoYXJkIHRvIHNheSB0aGVyZQo+IHdvbid0IGJlIHJlZ3Jlc3Npb24gZm9yIGFueSBuZXcgY29k
ZXMsIGVzcGVjaWFsbHkgdmlydGlvIGhhZCBhbHJlYWR5Cj4gc3VwcG9ydGVkIHNldmVyYWwgZGlm
ZmVyZW50IHR5cGVzIG9mIGRldmljZXMgYW5kIGRyaXZlcnMuCgpTdXJlLiBXZSB0ZXN0IHdoYXQg
d2UgY2FuLCBqdXN0IGRvbid0IGludHJvZHVjZSB1bnRlc3RlZCBjb2RlIG9yIGtub3duCnJlZ3Jl
c3Npb25zLgoKPiA+IEFzIGZvciBtb2QgcGFyYW1ldGVyIEkgYW0gbm90IGltcHJlc3NlZCAtCj4g
PiBubyBvbmUncyBnb2luZyB0byBoYXZlIHRoZSB0aW1lIG9yIGluY2xpbmF0aW9uIHRvIGRvIHRo
ZSByZXF1aXNpdGUKPiA+IHRlc3RpbmcgdG8ga25vdyB3aGV0aGVyIHRoZSBtb2R1bGUgcGFyYW1l
dGVyIGlzIHNhZmUuCj4gCj4gQWN0dWFsbHksIHRoYXQncyBvbmUgYWR2YW50YWdlLCBtb3N0IG9m
IHRoZSB1c2VycyBkb24ndCBjYXJlIHNvIHRoZQo+IHZhbGlkYXRpb24gaXMganVzdCBzdXBwcmVz
c2VkIGZvciB0aGVtLiBPdGhlcndpc2UgdGhleSBtaWdodCBnZXQKPiBzdXJwcmlzZWQgYWZ0ZXIg
dXBncmFkaW5nLiBUaGlzIGlzIHdoYXQgSSBsZWFybnQgZnJvbSB0aGUgcGFzdAo+IGhhcmRlbmlu
ZyBlZmZvcnQgbGlrZSB0aGlzIGFuZCB0aGUgSVJRIGhhcmRlbmluZy4KPiAKPiBGb3IgdGhlIHJl
c3QgbGlrZSBjb25maWRlbnRpYWwgdmVuZG9ycywgdGhleSBuZWVkIHRvIHRlc3QgYW5kIG1ha2UK
PiBzdXJlIHN1Y2gga2VybmVsIGNvbW1hbmQgbGluZSB3ZXJlIHByb3Zpc2lvbmVkIHRvIHRoZSBW
TS4KPiAKPiBUaGFua3MKCkVhY2ggbmV3IGJvb2xlYW4gb3B0aW9uIGRvdWJsZXMgUUUgZWZmb3J0
LiAgT25lIG9mIHRoZSByZWFzb25zCmNvbmZpZGVudGlhbCBzZWVtcyB0byBiZSBzdWNjZXNzZnVs
IHdoZXJlIHByZXZpb3VzIERSTSBzY2hlbWVzIG1vc3RseQpmYWlsZWQgaXMgYmVjYXVzZSBpdCBh
bGxvd3MgcnVubmluZyBMaW51eCB3aXRob3V0IG1hbnkgY2hhbmdlcy4KCj4gPgo+ID4gPiA+IGNv
cmUgY2FuIHByb3ZpZGUgdGhpcyBzZXJ2aWNlIGZvciB0aGUgZ2F6aWxsaW9uIG5vbgo+ID4gPiA+
ID4gcGVyZm9ybWFuY2UgY3JpdGljYWwgZHJpdmVycyB0aGF0IGp1c3Qgd2FudCB0byBrZWVwIHRo
aW5ncyBzaW1wbGUsCj4gPiA+ID4gPiBidXQgdGhlIDQtNSBjcml0aWNhbCBvbmVzIGNhbiBkbyB0
aGVpciBvd24gdmFsaWRhdGlvbiBpZiB0aGV5IHdhbnQgdG8uCj4gPiA+ID4gPgo+ID4gPiA+ID4g
PiBPciBzdWNoIHN0dWZmIGNvdWxkIGJlIGFkZGVkCj4gPiA+ID4gPiA+IG9uIHRvcCBzaW5jZSB0
aGUgdmFsaWRhdGlvbiBpcyBieSBkZWZhdWx0IGFueXdheS4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gVGhhbmtzCj4gPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4KPiA+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiBJJ2QgbGlrZSB0byBrbm93IHRoZSBmYXRlIG9m
IFZJUlRJT19IQVJERU5fTk9USUZJQ0FUSU9OIGJlZm9yZQo+ID4gPiA+ID4gPiA+ID4gPiB3ZSBk
byBtb3JlIGhhcmRlbmluZy4gSWYgaXQncyBpcnJldm9jYWJseSBicm9rZW4gbGV0J3MgcmlwIGl0
IG91dD8KPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiBTbyB0aGUgcGxhbiBpcwo+ID4g
PiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IDEpIGZpbmlzaCB1c2VkIHJpbmcgdmFsaWRhdGlv
biAodGhpcyBoYWQgYmVlbiBwcm9wb3NlZCwgbWVyZ2VkIGFuZAo+ID4gPiA+ID4gPiA+ID4gcmV2
ZXJ0ZWQgYmVmb3JlIG5vdGlmaWNhdGlvbiBoYXJkZW5pbmcpCj4gPiA+ID4gPiA+ID4gPiAyKSBk
byBub3RpZmljYXRpb24gaGFyZGVuaW5nIG9uIHRvcC4KPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4g
PiA+ID4gPiBTbyBsZXQncyBsZWF2ZSBpdCBhcyBpcyBhbmQgSSB3aWxsIGRvIGEgcmV3b3JrIGFm
dGVyIHdlIGZpbmFsaXplIHRoZQo+ID4gPiA+ID4gPiA+ID4gdXNlZCByaW5nIHZhbGlkYXRpb24u
Cj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gVGhhbmtzCj4gPiA+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiA+IC0t
LQo+ID4gPiA+ID4gPiA+ID4gPiA+IENoYW5nZXMgc2luY2UgVjQ6Cj4gPiA+ID4gPiA+ID4gPiA+
ID4gLSBkcm9wIHRoZSBmbGF0IGZvciBkcml2ZXIgdG8gc3VwcHJlc3MgdGhlIGNoZWNrCj4gPiA+
ID4gPiA+ID4gPiA+ID4gLSB2YWxpZGF0aW9uIGlzIGRpc2FibGVkIGJ5IGRlZmF1bHQKPiA+ID4g
PiA+ID4gPiA+ID4gPiAtIGRvbid0IGRvIHZhbGlkYXRpb24gZm9yIGxlZ2FjeSBkZXZpY2UKPiA+
ID4gPiA+ID4gPiA+ID4gPiAtIHJlYmFzZSBhbmQgc3VwcG9ydCB2aXJ0cXVldWUgcmVzaXplCj4g
PiA+ID4gPiA+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiA+ID4gPiA+ID4gIGRyaXZlcnMvdmlydGlv
L3ZpcnRpb19yaW5nLmMgfCA3NSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysK
PiA+ID4gPiA+ID4gPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDc1IGluc2VydGlvbnMoKykKPiA+
ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3ZpcnRpby92aXJ0aW9fcmluZy5jIGIvZHJpdmVycy92aXJ0aW8vdmlydGlvX3JpbmcuYwo+ID4g
PiA+ID4gPiA+ID4gPiA+IGluZGV4IDE0M2YzODBiYWExYy4uNWIxNTE2MDVhYWY4IDEwMDY0NAo+
ID4gPiA+ID4gPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19yaW5nLmMKPiA+
ID4gPiA+ID4gPiA+ID4gPiArKysgYi9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jCj4gPiA+
ID4gPiA+ID4gPiA+ID4gQEAgLTE1LDYgKzE1LDkgQEAKPiA+ID4gPiA+ID4gPiA+ID4gPiAgI2lu
Y2x1ZGUgPGxpbnV4L3NwaW5sb2NrLmg+Cj4gPiA+ID4gPiA+ID4gPiA+ID4gICNpbmNsdWRlIDx4
ZW4veGVuLmg+Cj4gPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gPiArc3RhdGlj
IGJvb2wgZm9yY2VfdXNlZF92YWxpZGF0aW9uID0gZmFsc2U7Cj4gPiA+ID4gPiA+ID4gPiA+ID4g
K21vZHVsZV9wYXJhbShmb3JjZV91c2VkX3ZhbGlkYXRpb24sIGJvb2wsIDA0NDQpOwo+ID4gPiA+
ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+ID4gPiAgI2lmZGVmIERFQlVHCj4gPiA+ID4g
PiA+ID4gPiA+ID4gIC8qIEZvciBkZXZlbG9wbWVudCwgd2Ugd2FudCB0byBjcmFzaCB3aGVuZXZl
ciB0aGUgcmluZyBpcyBzY3Jld2VkLiAqLwo+ID4gPiA+ID4gPiA+ID4gPiA+ICAjZGVmaW5lIEJB
RF9SSU5HKF92cSwgZm10LCBhcmdzLi4uKSAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4g
PiA+ID4gPiA+ID4gPiA+IEBAIC0xMDUsNiArMTA4LDkgQEAgc3RydWN0IHZyaW5nX3ZpcnRxdWV1
ZV9zcGxpdCB7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgc3RydWN0IHZyaW5nX2Rlc2Nfc3Rh
dGVfc3BsaXQgKmRlc2Nfc3RhdGU7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgc3RydWN0IHZy
aW5nX2Rlc2NfZXh0cmEgKmRlc2NfZXh0cmE7Cj4gPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gPiA+ID4gPiArICAgICAvKiBNYXhpbXVtIGluIGJ1ZmZlciBsZW5ndGgsIE5VTEwgbWVhbnMg
bm8gdXNlZCB2YWxpZGF0aW9uICovCj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgdTMyICpidWZs
ZW47Cj4gPiA+ID4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAgIC8qIERN
QSBhZGRyZXNzIGFuZCBzaXplIGluZm9ybWF0aW9uICovCj4gPiA+ID4gPiA+ID4gPiA+ID4gICAg
ICAgZG1hX2FkZHJfdCBxdWV1ZV9kbWFfYWRkcjsKPiA+ID4gPiA+ID4gPiA+ID4gPiAgICAgICBz
aXplX3QgcXVldWVfc2l6ZV9pbl9ieXRlczsKPiA+ID4gPiA+ID4gPiA+ID4gPiBAQCAtMTQ1LDYg
KzE1MSw5IEBAIHN0cnVjdCB2cmluZ192aXJ0cXVldWVfcGFja2VkIHsKPiA+ID4gPiA+ID4gPiA+
ID4gPiAgICAgICBzdHJ1Y3QgdnJpbmdfZGVzY19zdGF0ZV9wYWNrZWQgKmRlc2Nfc3RhdGU7Cj4g
PiA+ID4gPiA+ID4gPiA+ID4gICAgICAgc3RydWN0IHZyaW5nX2Rlc2NfZXh0cmEgKmRlc2NfZXh0
cmE7Cj4gPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gPiArICAgICAvKiBNYXhp
bXVtIGluIGJ1ZmZlciBsZW5ndGgsIE5VTEwgbWVhbnMgbm8gdXNlZCB2YWxpZGF0aW9uICovCj4g
PiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgdTMyICpidWZsZW47Cj4gPiA+ID4gPiA+ID4gPiA+ID4g
Kwo+ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAgIC8qIERNQSBhZGRyZXNzIGFuZCBzaXplIGluZm9y
bWF0aW9uICovCj4gPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgZG1hX2FkZHJfdCByaW5nX2RtYV9h
ZGRyOwo+ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAgIGRtYV9hZGRyX3QgZHJpdmVyX2V2ZW50X2Rt
YV9hZGRyOwo+ID4gPiA+ID4gPiA+ID4gPiA+IEBAIC01NTIsNiArNTYxLDcgQEAgc3RhdGljIGlu
bGluZSBpbnQgdmlydHF1ZXVlX2FkZF9zcGxpdChzdHJ1Y3QgdmlydHF1ZXVlICpfdnEsCj4gPiA+
ID4gPiA+ID4gPiA+ID4gICAgICAgdW5zaWduZWQgaW50IGksIG4sIGF2YWlsLCBkZXNjc191c2Vk
LCBwcmV2LCBlcnJfaWR4Owo+ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAgIGludCBoZWFkOwo+ID4g
PiA+ID4gPiA+ID4gPiA+ICAgICAgIGJvb2wgaW5kaXJlY3Q7Cj4gPiA+ID4gPiA+ID4gPiA+ID4g
KyAgICAgdTMyIGJ1ZmxlbiA9IDA7Cj4gPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+
ID4gPiAgICAgICBTVEFSVF9VU0UodnEpOwo+ID4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+
ID4gPiA+ID4gQEAgLTYzNSw2ICs2NDUsNyBAQCBzdGF0aWMgaW5saW5lIGludCB2aXJ0cXVldWVf
YWRkX3NwbGl0KHN0cnVjdCB2aXJ0cXVldWUgKl92cSwKPiA+ID4gPiA+ID4gPiA+ID4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBWUklOR19ERVND
X0ZfTkVYVCB8Cj4gPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgVlJJTkdfREVTQ19GX1dSSVRFLAo+ID4gPiA+ID4gPiA+
ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGluZGlyZWN0KTsKPiA+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgYnVm
bGVuICs9IHNnLT5sZW5ndGg7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICB9Cj4g
PiA+ID4gPiA+ID4gPiA+ID4gICAgICAgfQo+ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAgIC8qIExh
c3Qgb25lIGRvZXNuJ3QgY29udGludWUuICovCj4gPiA+ID4gPiA+ID4gPiA+ID4gQEAgLTY3NSw2
ICs2ODYsMTAgQEAgc3RhdGljIGlubGluZSBpbnQgdmlydHF1ZXVlX2FkZF9zcGxpdChzdHJ1Y3Qg
dmlydHF1ZXVlICpfdnEsCj4gPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgZWxzZQo+ID4gPiA+ID4g
PiA+ID4gPiA+ICAgICAgICAgICAgICAgdnEtPnNwbGl0LmRlc2Nfc3RhdGVbaGVhZF0uaW5kaXJf
ZGVzYyA9IGN0eDsKPiA+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiA+ICsgICAg
IC8qIFN0b3JlIGluIGJ1ZmZlciBsZW5ndGggaWYgbmVjZXNzYXJ5ICovCj4gPiA+ID4gPiA+ID4g
PiA+ID4gKyAgICAgaWYgKHZxLT5zcGxpdC5idWZsZW4pCj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAg
ICAgICAgICAgICB2cS0+c3BsaXQuYnVmbGVuW2hlYWRdID0gYnVmbGVuOwo+ID4gPiA+ID4gPiA+
ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+ID4gPiAgICAgICAvKiBQdXQgZW50cnkgaW4gYXZhaWxh
YmxlIGFycmF5IChidXQgZG9uJ3QgdXBkYXRlIGF2YWlsLT5pZHggdW50aWwgdGhleQo+ID4gPiA+
ID4gPiA+ID4gPiA+ICAgICAgICAqIGRvIHN5bmMpLiAqLwo+ID4gPiA+ID4gPiA+ID4gPiA+ICAg
ICAgIGF2YWlsID0gdnEtPnNwbGl0LmF2YWlsX2lkeF9zaGFkb3cgJiAodnEtPnNwbGl0LnZyaW5n
Lm51bSAtIDEpOwo+ID4gPiA+ID4gPiA+ID4gPiA+IEBAIC04NjEsNiArODc2LDExIEBAIHN0YXRp
YyB2b2lkICp2aXJ0cXVldWVfZ2V0X2J1Zl9jdHhfc3BsaXQoc3RydWN0IHZpcnRxdWV1ZSAqX3Zx
LAo+ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgQkFEX1JJTkcodnEsICJpZCAldSBp
cyBub3QgYSBoZWFkIVxuIiwgaSk7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICBy
ZXR1cm4gTlVMTDsKPiA+ID4gPiA+ID4gPiA+ID4gPiAgICAgICB9Cj4gPiA+ID4gPiA+ID4gPiA+
ID4gKyAgICAgaWYgKHZxLT5zcGxpdC5idWZsZW4gJiYgdW5saWtlbHkoKmxlbiA+IHZxLT5zcGxp
dC5idWZsZW5baV0pKSB7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICBCQURfUklO
Ryh2cSwgInVzZWQgbGVuICVkIGlzIGxhcmdlciB0aGFuIG1heCBpbiBidWZmZXIgbGVuICV1XG4i
LAo+ID4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAqbGVuLCB2cS0+c3Bs
aXQuYnVmbGVuW2ldKTsKPiA+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgIHJldHVybiBO
VUxMOwo+ID4gPiA+ID4gPiA+ID4gPiA+ICsgICAgIH0KPiA+ID4gPiA+ID4gPiA+ID4gPgo+ID4g
PiA+ID4gPiA+ID4gPiA+ICAgICAgIC8qIGRldGFjaF9idWZfc3BsaXQgY2xlYXJzIGRhdGEsIHNv
IGdyYWIgaXQgbm93LiAqLwo+ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAgIHJldCA9IHZxLT5zcGxp
dC5kZXNjX3N0YXRlW2ldLmRhdGE7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gQEAgLTEwODUsMTAgKzEx
MDUsMjUgQEAgc3RhdGljIHZvaWQgdnJpbmdfZnJlZV9zcGxpdChzdHJ1Y3QgdnJpbmdfdmlydHF1
ZXVlX3NwbGl0ICp2cmluZ19zcGxpdCwKPiA+ID4gPiA+ID4gPiA+ID4gPiAgICAgICAgICAgICAg
ICAgICAgICAgIHZyaW5nX3NwbGl0LT5xdWV1ZV9kbWFfYWRkciwKPiA+ID4gPiA+ID4gPiA+ID4g
PiAgICAgICAgICAgICAgICAgICAgICAgIGRtYV9kZXYpOwo+ID4gPiA+ID4gPiA+ID4gPiA+Cj4g
PiA+ID4gPiA+ID4gPiA+ID4gKyAgICAga2ZyZWUodnJpbmdfc3BsaXQtPmJ1Zmxlbik7Cj4gPiA+
ID4gPiA+ID4gPiA+ID4gICAgICAga2ZyZWUodnJpbmdfc3BsaXQtPmRlc2Nfc3RhdGUpOwo+ID4g
PiA+ID4gPiA+ID4gPiA+ICAgICAgIGtmcmVlKHZyaW5nX3NwbGl0LT5kZXNjX2V4dHJhKTsKPiA+
ID4gPiA+ID4gPiA+ID4gPiAgfQo+ID4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+
ID4gK3N0YXRpYyBib29sIHZyaW5nX25lZWRzX3VzZWRfdmFsaWRhdGlvbihjb25zdCBzdHJ1Y3Qg
dmlydGlvX2RldmljZSAqdmRldikKPiA+ID4gPiA+ID4gPiA+ID4gPiArewo+ID4gPiA+ID4gPiA+
ID4gPiA+ICsgICAgIC8qCj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICogU2V2ZXJhbCBsZWdh
Y3kgZGV2aWNlcyBhcmUga25vd24gdG8gcHJvZHVjZSBidWdneSB1c2VkCj4gPiA+ID4gPiA+ID4g
PiA+ID4gKyAgICAgICogbGVuZ3RoLiBJbiBvcmRlciB0byBsZXQgZHJpdmVyIHdvcmssIHdlIHdv
bid0IHZhbGlkYXRlIHVzZWQKPiA+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgKiBidWZmZXIgbGVu
Z3RoIGluIHRoaXMgY2FzZS4KPiA+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgKi8KPiA+ID4gPiA+
ID4gPiA+ID4gPiArICAgICBpZiAoIXZpcnRpb19oYXNfZmVhdHVyZSh2ZGV2LCBWSVJUSU9fRl9W
RVJTSU9OXzEpKQo+ID4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgcmV0dXJuIGZhbHNl
Owo+ID4gPiA+ID4gPiA+ID4gPiA+ICsgICAgIGlmIChmb3JjZV91c2VkX3ZhbGlkYXRpb24pCj4g
PiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsKPiA+ID4gPiA+ID4g
PiA+ID4gPiArICAgICByZXR1cm4gZmFsc2U7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gK30KPiA+ID4g
PiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gPiA+ID4gIHN0YXRpYyBpbnQgdnJpbmdfYWxs
b2NfcXVldWVfc3BsaXQoc3RydWN0IHZyaW5nX3ZpcnRxdWV1ZV9zcGxpdCAqdnJpbmdfc3BsaXQs
Cj4gPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3Ry
dWN0IHZpcnRpb19kZXZpY2UgKnZkZXYsCj4gPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdTMyIG51bSwKPiA+ID4gPiA+ID4gPiA+ID4gPiBAQCAtMTEz
Nyw3ICsxMTcyLDE5IEBAIHN0YXRpYyBpbnQgdnJpbmdfYWxsb2NfcXVldWVfc3BsaXQoc3RydWN0
IHZyaW5nX3ZpcnRxdWV1ZV9zcGxpdCAqdnJpbmdfc3BsaXQsCj4gPiA+ID4gPiA+ID4gPiA+ID4g
ICAgICAgdnJpbmdfc3BsaXQtPnZyaW5nX2FsaWduID0gdnJpbmdfYWxpZ247Cj4gPiA+ID4gPiA+
ID4gPiA+ID4gICAgICAgdnJpbmdfc3BsaXQtPm1heV9yZWR1Y2VfbnVtID0gbWF5X3JlZHVjZV9u
dW07Cj4gPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gPiArICAgICBpZiAodnJp
bmdfbmVlZHNfdXNlZF92YWxpZGF0aW9uKHZkZXYpKSB7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAg
ICAgICAgICAgICB2cmluZ19zcGxpdC0+YnVmbGVuID0KPiA+ID4gPiA+ID4gPiA+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAga21hbGxvY19hcnJheShudW0sIHNpemVvZigqdnJpbmdfc3BsaXQt
PmJ1ZmxlbiksCj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgR0ZQX0tFUk5FTCk7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICBp
ZiAoIXZyaW5nX3NwbGl0LT5idWZsZW4pCj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgIGdvdG8gZXJyX2J1ZmxlbjsKPiA+ID4gPiA+ID4gPiA+ID4gPiArICAgICB9Cj4g
PiA+ID4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAgIHJldHVybiAwOwo+
ID4gPiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+ID4gPiArZXJyX2J1ZmxlbjoKPiA+
ID4gPiA+ID4gPiA+ID4gPiArICAgICB2cmluZ19mcmVlX3NwbGl0KHZyaW5nX3NwbGl0LCB2ZGV2
LCBkbWFfZGV2KTsKPiA+ID4gPiA+ID4gPiA+ID4gPiArICAgICByZXR1cm4gLUVOT01FTTsKPiA+
ID4gPiA+ID4gPiA+ID4gPiAgfQo+ID4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+
ID4gIHN0YXRpYyBzdHJ1Y3QgdmlydHF1ZXVlICp2cmluZ19jcmVhdGVfdmlydHF1ZXVlX3NwbGl0
KAo+ID4gPiA+ID4gPiA+ID4gPiA+IEBAIC0xMjk3LDYgKzEzNDQsNyBAQCBzdGF0aWMgaW50IHZp
cnRxdWV1ZV9hZGRfaW5kaXJlY3RfcGFja2VkKHN0cnVjdCB2cmluZ192aXJ0cXVldWUgKnZxLAo+
ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAgIHVuc2lnbmVkIGludCBpLCBuLCBlcnJfaWR4Owo+ID4g
PiA+ID4gPiA+ID4gPiA+ICAgICAgIHUxNiBoZWFkLCBpZDsKPiA+ID4gPiA+ID4gPiA+ID4gPiAg
ICAgICBkbWFfYWRkcl90IGFkZHI7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgdTMyIGJ1Zmxl
biA9IDA7Cj4gPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gPiAgICAgICBoZWFk
ID0gdnEtPnBhY2tlZC5uZXh0X2F2YWlsX2lkeDsKPiA+ID4gPiA+ID4gPiA+ID4gPiAgICAgICBk
ZXNjID0gYWxsb2NfaW5kaXJlY3RfcGFja2VkKHRvdGFsX3NnLCBnZnApOwo+ID4gPiA+ID4gPiA+
ID4gPiA+IEBAIC0xMzI1LDYgKzEzNzMsOCBAQCBzdGF0aWMgaW50IHZpcnRxdWV1ZV9hZGRfaW5k
aXJlY3RfcGFja2VkKHN0cnVjdCB2cmluZ192aXJ0cXVldWUgKnZxLAo+ID4gPiA+ID4gPiA+ID4g
PiA+ICAgICAgICAgICAgICAgICAgICAgICBkZXNjW2ldLmFkZHIgPSBjcHVfdG9fbGU2NChhZGRy
KTsKPiA+ID4gPiA+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgZGVzY1tpXS5sZW4g
PSBjcHVfdG9fbGUzMihzZy0+bGVuZ3RoKTsKPiA+ID4gPiA+ID4gPiA+ID4gPiAgICAgICAgICAg
ICAgICAgICAgICAgaSsrOwo+ID4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAg
ICBpZiAobiA+PSBvdXRfc2dzKQo+ID4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGJ1ZmxlbiArPSBzZy0+bGVuZ3RoOwo+ID4gPiA+ID4gPiA+ID4gPiA+ICAg
ICAgICAgICAgICAgfQo+ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAgIH0KPiA+ID4gPiA+ID4gPiA+
ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiA+IEBAIC0xMzc5LDYgKzE0MjksMTAgQEAgc3RhdGljIGlu
dCB2aXJ0cXVldWVfYWRkX2luZGlyZWN0X3BhY2tlZChzdHJ1Y3QgdnJpbmdfdmlydHF1ZXVlICp2
cSwKPiA+ID4gPiA+ID4gPiA+ID4gPiAgICAgICB2cS0+cGFja2VkLmRlc2Nfc3RhdGVbaWRdLmxh
c3QgPSBpZDsKPiA+ID4gPiA+ID4gPiA+ID4gPiAgICAgICB2cS0+cGFja2VkLmRlc2Nfc3RhdGVb
aWRdLnByZW1hcHBlZCA9IHByZW1hcHBlZDsKPiA+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiA+ID4gPiA+ICsgICAgIC8qIFN0b3JlIGluIGJ1ZmZlciBsZW5ndGggaWYgbmVjZXNzYXJ5ICov
Cj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgaWYgKHZxLT5wYWNrZWQuYnVmbGVuKQo+ID4gPiA+
ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgdnEtPnBhY2tlZC5idWZsZW5baWRdID0gYnVmbGVu
Owo+ID4gPiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+ID4gPiAgICAgICB2cS0+bnVt
X2FkZGVkICs9IDE7Cj4gPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gPiAgICAg
ICBwcl9kZWJ1ZygiQWRkZWQgYnVmZmVyIGhlYWQgJWkgdG8gJXBcbiIsIGhlYWQsIHZxKTsKPiA+
ID4gPiA+ID4gPiA+ID4gPiBAQCAtMTQxNiw2ICsxNDcwLDcgQEAgc3RhdGljIGlubGluZSBpbnQg
dmlydHF1ZXVlX2FkZF9wYWNrZWQoc3RydWN0IHZpcnRxdWV1ZSAqX3ZxLAo+ID4gPiA+ID4gPiA+
ID4gPiA+ICAgICAgIF9fbGUxNiBoZWFkX2ZsYWdzLCBmbGFnczsKPiA+ID4gPiA+ID4gPiA+ID4g
PiAgICAgICB1MTYgaGVhZCwgaWQsIHByZXYsIGN1cnIsIGF2YWlsX3VzZWRfZmxhZ3M7Cj4gPiA+
ID4gPiA+ID4gPiA+ID4gICAgICAgaW50IGVycjsKPiA+ID4gPiA+ID4gPiA+ID4gPiArICAgICB1
MzIgYnVmbGVuID0gMDsKPiA+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiA+ICAg
ICAgIFNUQVJUX1VTRSh2cSk7Cj4gPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4g
PiBAQCAtMTQ5OCw2ICsxNTUzLDggQEAgc3RhdGljIGlubGluZSBpbnQgdmlydHF1ZXVlX2FkZF9w
YWNrZWQoc3RydWN0IHZpcnRxdWV1ZSAqX3ZxLAo+ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMSA8PCBWUklOR19QQUNLRURfREVTQ19GX0FW
QUlMIHwKPiA+ID4gPiA+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIDEgPDwgVlJJTkdfUEFDS0VEX0RFU0NfRl9VU0VEOwo+ID4gPiA+ID4gPiA+ID4gPiA+
ICAgICAgICAgICAgICAgICAgICAgICB9Cj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgIGlmIChuID49IG91dF9zZ3MpCj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgYnVmbGVuICs9IHNnLT5sZW5ndGg7Cj4gPiA+ID4gPiA+ID4g
PiA+ID4gICAgICAgICAgICAgICB9Cj4gPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgfQo+ID4gPiA+
ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+ID4gQEAgLTE1MTgsNiArMTU3NSwxMCBAQCBz
dGF0aWMgaW5saW5lIGludCB2aXJ0cXVldWVfYWRkX3BhY2tlZChzdHJ1Y3QgdmlydHF1ZXVlICpf
dnEsCj4gPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgdnEtPnBhY2tlZC5kZXNjX3N0YXRlW2lkXS5s
YXN0ID0gcHJldjsKPiA+ID4gPiA+ID4gPiA+ID4gPiAgICAgICB2cS0+cGFja2VkLmRlc2Nfc3Rh
dGVbaWRdLnByZW1hcHBlZCA9IHByZW1hcHBlZDsKPiA+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+
ID4gPiA+ID4gPiA+ICsgICAgIC8qIFN0b3JlIGluIGJ1ZmZlciBsZW5ndGggaWYgbmVjZXNzYXJ5
ICovCj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgaWYgKHZxLT5wYWNrZWQuYnVmbGVuKQo+ID4g
PiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgdnEtPnBhY2tlZC5idWZsZW5baWRdID0gYnVm
bGVuOwo+ID4gPiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+ID4gPiAgICAgICAvKgo+
ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAqIEEgZHJpdmVyIE1VU1QgTk9UIG1ha2UgdGhlIGZp
cnN0IGRlc2NyaXB0b3IgaW4gdGhlIGxpc3QKPiA+ID4gPiA+ID4gPiA+ID4gPiAgICAgICAgKiBh
dmFpbGFibGUgYmVmb3JlIGFsbCBzdWJzZXF1ZW50IGRlc2NyaXB0b3JzIGNvbXByaXNpbmcKPiA+
ID4gPiA+ID4gPiA+ID4gPiBAQCAtMTcxOCw2ICsxNzc5LDExIEBAIHN0YXRpYyB2b2lkICp2aXJ0
cXVldWVfZ2V0X2J1Zl9jdHhfcGFja2VkKHN0cnVjdCB2aXJ0cXVldWUgKl92cSwKPiA+ID4gPiA+
ID4gPiA+ID4gPiAgICAgICAgICAgICAgIEJBRF9SSU5HKHZxLCAiaWQgJXUgaXMgbm90IGEgaGVh
ZCFcbiIsIGlkKTsKPiA+ID4gPiA+ID4gPiA+ID4gPiAgICAgICAgICAgICAgIHJldHVybiBOVUxM
Owo+ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAgIH0KPiA+ID4gPiA+ID4gPiA+ID4gPiArICAgICBp
ZiAodnEtPnBhY2tlZC5idWZsZW4gJiYgdW5saWtlbHkoKmxlbiA+IHZxLT5wYWNrZWQuYnVmbGVu
W2lkXSkpIHsKPiA+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgIEJBRF9SSU5HKHZxLCAi
dXNlZCBsZW4gJWQgaXMgbGFyZ2VyIHRoYW4gbWF4IGluIGJ1ZmZlciBsZW4gJXVcbiIsCj4gPiA+
ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICpsZW4sIHZxLT5wYWNrZWQuYnVm
bGVuW2lkXSk7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICByZXR1cm4gTlVMTDsK
PiA+ID4gPiA+ID4gPiA+ID4gPiArICAgICB9Cj4gPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gPiA+ID4gPiAgICAgICAvKiBkZXRhY2hfYnVmX3BhY2tlZCBjbGVhcnMgZGF0YSwgc28gZ3Jh
YiBpdCBub3cuICovCj4gPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgcmV0ID0gdnEtPnBhY2tlZC5k
ZXNjX3N0YXRlW2lkXS5kYXRhOwo+ID4gPiA+ID4gPiA+ID4gPiA+IEBAIC0xOTM3LDYgKzIwMDMs
NyBAQCBzdGF0aWMgdm9pZCB2cmluZ19mcmVlX3BhY2tlZChzdHJ1Y3QgdnJpbmdfdmlydHF1ZXVl
X3BhY2tlZCAqdnJpbmdfcGFja2VkLAo+ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB2cmluZ19wYWNrZWQtPmRldmljZV9ldmVudF9kbWFfYWRkciwKPiA+
ID4gPiA+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZG1hX2Rldik7
Cj4gPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gPiArICAgICBrZnJlZSh2cmlu
Z19wYWNrZWQtPmJ1Zmxlbik7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gICAgICAga2ZyZWUodnJpbmdf
cGFja2VkLT5kZXNjX3N0YXRlKTsKPiA+ID4gPiA+ID4gPiA+ID4gPiAgICAgICBrZnJlZSh2cmlu
Z19wYWNrZWQtPmRlc2NfZXh0cmEpOwo+ID4gPiA+ID4gPiA+ID4gPiA+ICB9Cj4gPiA+ID4gPiA+
ID4gPiA+ID4gQEAgLTE5ODgsNiArMjA1NSwxNCBAQCBzdGF0aWMgaW50IHZyaW5nX2FsbG9jX3F1
ZXVlX3BhY2tlZChzdHJ1Y3QgdnJpbmdfdmlydHF1ZXVlX3BhY2tlZCAqdnJpbmdfcGFja2VkLAo+
ID4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgdnJpbmdfcGFja2Vk
LT52cmluZy5udW0gPSBudW07Cj4gPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4g
PiArICAgICBpZiAodnJpbmdfbmVlZHNfdXNlZF92YWxpZGF0aW9uKHZkZXYpKSB7Cj4gPiA+ID4g
PiA+ID4gPiA+ID4gKyAgICAgICAgICAgICB2cmluZ19wYWNrZWQtPmJ1ZmxlbiA9Cj4gPiA+ID4g
PiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIGttYWxsb2NfYXJyYXkobnVtLCBzaXpl
b2YoKnZyaW5nX3BhY2tlZC0+YnVmbGVuKSwKPiA+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBHRlBfS0VSTkVMKTsKPiA+ID4gPiA+ID4gPiA+ID4g
PiArICAgICAgICAgICAgIGlmICghdnJpbmdfcGFja2VkLT5idWZsZW4pCj4gPiA+ID4gPiA+ID4g
PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIGdvdG8gZXJyOwo+ID4gPiA+ID4gPiA+ID4gPiA+
ICsgICAgIH0KPiA+ID4gPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gPiA+ID4gICAgICAg
cmV0dXJuIDA7Cj4gPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gPiAgZXJyOgo+
ID4gPiA+ID4gPiA+ID4gPiA+IC0tCj4gPiA+ID4gPiA+ID4gPiA+ID4gMi4yNS4xCj4gPiA+ID4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+Cj4gPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0
ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMu
bGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
