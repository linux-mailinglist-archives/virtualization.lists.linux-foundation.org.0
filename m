Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 130CB708E68
	for <lists.virtualization@lfdr.de>; Fri, 19 May 2023 05:38:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 995287000E;
	Fri, 19 May 2023 03:38:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 995287000E
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VjIPCXFs
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xghgo7OQ00UU; Fri, 19 May 2023 03:38:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id EA13A7000C;
	Fri, 19 May 2023 03:38:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA13A7000C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 30DF0C007C;
	Fri, 19 May 2023 03:38:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7302CC002A
 for <virtualization@lists.linux-foundation.org>;
 Fri, 19 May 2023 03:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C6C842851
 for <virtualization@lists.linux-foundation.org>;
 Fri, 19 May 2023 03:38:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C6C842851
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=VjIPCXFs
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zksT7I_NtQVJ
 for <virtualization@lists.linux-foundation.org>;
 Fri, 19 May 2023 03:38:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E6604212F
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7E6604212F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 19 May 2023 03:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684467521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ki0kHDdHx6g6Wwap2LhG64VjMaWd30vnfS39Xvo3xBI=;
 b=VjIPCXFsR9TBsXwla59b8dCm119o5qemJLQSfgXW+IUe0MfBsQRMI4gK4cVdqR1HVNa8i4
 7kFCHOpKDhQkFe7qoM+HuMn4UD/3T/IGRsYMELs/pJl5j58X2G0q9hGPD5lu/7cq3QHVFa
 4ujM04s22B1ZmAHZG9r9FIgUVO2oVvE=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-xnxWkjwsNrmJEQbYvKcVJA-1; Thu, 18 May 2023 23:38:39 -0400
X-MC-Unique: xnxWkjwsNrmJEQbYvKcVJA-1
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-1ae7d4ddcd3so2805925ad.3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 May 2023 20:38:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684467518; x=1687059518;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ki0kHDdHx6g6Wwap2LhG64VjMaWd30vnfS39Xvo3xBI=;
 b=BAjxShAWjhho0X1BsMPhT5Jq9ltv0kTit/55rkfwQR7Ceea+91vvjlxa8oOqa+bKsu
 u/UksGQNSAjiepKpJ6it6aDWxWZuENF3IKQ5wfQPY5nySBguw3VIdeutqhWfqmnzA7n5
 iqycT+PMWkAJFoZdgu5VoEaPGt4b2QIxOpa1JRGTaxX+tzz9KPi7HmJOe206lMIi7uK+
 Ez2L0cCgaJSRNyI0ojxx5KUnKKkxH+nje42eI4XC+qpFX758xAmYi+XtaoEKjieU/jug
 jMYFQwrD5NLPpVPVLX9y77ynreqLmjvzfWkAbPlIW1dKiJIwCFCAev6nxZyGBJnqw+CQ
 RhAA==
X-Gm-Message-State: AC+VfDxkvnmLUk5bLF1neJuMnPMtJmgxYTIQFnjEu1uABL9rfksd/l0U
 2Pu6ik5OSu7OyutR18jMBvV8IxAgfH+seV2HlyMywM3RXPnr0Dxpx224aLnatVPV378M3Mo8qUC
 felyh3D8lPuCySt/7yMuqXEuIaZbfRdsRDymIs8a+yg==
X-Received: by 2002:a17:902:f807:b0:1ad:e5e6:6c30 with SMTP id
 ix7-20020a170902f80700b001ade5e66c30mr1202217plb.44.1684467518420; 
 Thu, 18 May 2023 20:38:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6qvzMrjeZTscqG3VLHoBS0Ux1VvX+mnnIOknVTTWkYXhKmRdiNZRJp8LnR6wtjMOevnaugsw==
X-Received: by 2002:a17:902:f807:b0:1ad:e5e6:6c30 with SMTP id
 ix7-20020a170902f80700b001ade5e66c30mr1202200plb.44.1684467517912; 
 Thu, 18 May 2023 20:38:37 -0700 (PDT)
Received: from [10.72.13.154] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a170902ecc700b001ac95be5081sm2189246plh.307.2023.05.18.20.38.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 May 2023 20:38:37 -0700 (PDT)
Message-ID: <bb53198a-9194-a378-5ee7-4fc41fcaa179@redhat.com>
Date: Fri, 19 May 2023 11:38:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH vhost v9 05/12] virtio_ring: split: virtqueue_add_split()
 support premapped
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
References: <20230517022249.20790-1-xuanzhuo@linux.alibaba.com>
 <20230517022249.20790-6-xuanzhuo@linux.alibaba.com>
 <CACGkMEu7+kDPiWmULXW_saW6pb5yF=gnqXRkSWcYbZCiJmszHQ@mail.gmail.com>
 <20230518030701-mutt-send-email-mst@kernel.org>
 <1684395232.2129312-1-xuanzhuo@linux.alibaba.com>
 <20230518041446-mutt-send-email-mst@kernel.org>
 <CACGkMEso-pDo_sDN_nCR95WSOh32wtUQAfWLy69tOyXr7EA9_g@mail.gmail.com>
 <1684401243.4437356-2-xuanzhuo@linux.alibaba.com>
 <20230518054517-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20230518054517-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: Christoph Hellwig <hch@infradead.org>,
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

CuWcqCAyMDIzLzUvMTggMTc6NDksIE1pY2hhZWwgUy4gVHNpcmtpbiDlhpnpgZM6Cj4gT24gVGh1
LCBNYXkgMTgsIDIwMjMgYXQgMDU6MTQ6MDNQTSArMDgwMCwgWHVhbiBaaHVvIHdyb3RlOgo+PiBP
biBUaHUsIDE4IE1heSAyMDIzIDE2OjU3OjM3ICswODAwLCBKYXNvbiBXYW5nIDxqYXNvd2FuZ0By
ZWRoYXQuY29tPiB3cm90ZToKPj4+IE9uIFRodSwgTWF5IDE4LCAyMDIzIGF0IDQ6MjnigK9QTSBN
aWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPiB3cm90ZToKPj4+PiBPbiBUaHUsIE1h
eSAxOCwgMjAyMyBhdCAwMzozMzo1MlBNICswODAwLCBYdWFuIFpodW8gd3JvdGU6Cj4+Pj4+IE9u
IFRodSwgMTggTWF5IDIwMjMgMDM6MTE6MjUgLTA0MDAsICJNaWNoYWVsIFMuIFRzaXJraW4iIDxt
c3RAcmVkaGF0LmNvbT4gd3JvdGU6Cj4+Pj4+PiBPbiBUaHUsIE1heSAxOCwgMjAyMyBhdCAwMjo1
MTo1N1BNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+Pj4+Pj4+IE9uIFdlZCwgTWF5IDE3LCAy
MDIzIGF0IDEwOjIz4oCvQU0gWHVhbiBaaHVvIDx4dWFuemh1b0BsaW51eC5hbGliYWJhLmNvbT4g
d3JvdGU6Cj4+Pj4+Pj4+IHZpcnRxdWV1ZV9hZGRfc3BsaXQoKSBvbmx5IHN1cHBvcnRzIHZpcnR1
YWwgYWRkcmVzc2VzLCBkbWEgaXMgY29tcGxldGVkCj4+Pj4+Pj4+IGluIHZpcnRxdWV1ZV9hZGRf
c3BsaXQoKS4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gSW4gc29tZSBzY2VuYXJpb3MgKHN1Y2ggYXMgdGhl
IEFGX1hEUCBzY2VuYXJpbyksIHRoZSBtZW1vcnkgaXMgYWxsb2NhdGVkCj4+Pj4+Pj4+IGFuZCBE
TUEgaXMgY29tcGxldGVkIGluIGFkdmFuY2UsIHNvIGl0IGlzIG5lY2Vzc2FyeSBmb3IgdXMgdG8g
c3VwcG9ydAo+Pj4+Pj4+PiBwYXNzaW5nIHRoZSBETUEgYWRkcmVzcyB0byB2aXJ0cXVldWVfYWRk
X3NwbGl0KCkuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFJlY29yZCB0aGlzIGluZm9ybWF0aW9uIGluIGRl
c2Nfc3RhdGUsIHdlIGNhbiBza2lwIHVubWFwIGJhc2VkIG9uIHRoaXMKPj4+Pj4+Pj4gd2hlbiBl
eGVjdXRpbmcgZG1hIHVubWFwLgo+Pj4+Pj4+IEkgd291bGQgYWxzbyBzdWdnZXN0IGRvY3VtZW50
aW5nIHdoeSBhIHBlciBkZXNjcmlwdG9yIG1ldGFkYXRhIGlzCj4+Pj4+Pj4gbmVlZGVkIGluc3Rl
YWQgb2YgYSBwZXIgdmlydHF1ZXVlIG9uZS4KPj4+Pj4+IEkgdGhpbmsgd2UgY291bGQgbWFrZSBp
dCBwZXIgdmlydHF1ZXVlLiBUaGF0IHdvdWxkIG1lYW4gYWxsIGNvZGUgaW4KPj4+Pj4+IHZpcnRp
byBuZXQgd291bGQgaGF2ZSB0byBjaGFuZ2UgdG8gZG8gZG1hIG1hcHBpbmcgaXRzZWxmIGluc3Rl
YWQgb2YKPj4+Pj4+IHJlbHlpbmcgb24gdmlydGlvIGNvcmUgdGhvdWdoLiAgV2hpY2ggaXMgbWF5
YmUgYSBnb29kIGlkZWE/IERlZmluaXRlbHkgYQo+Pj4+Pj4gdmVyeSBpbnRydXNpdmUgY2hhbmdl
IHRob3VnaCwgd2lsbCBuZWVkIGEgbG90IG9mIHBlcmZvcm1hbmNlIHRlc3RpbmcKPj4+Pj4+IHRv
IG1ha2Ugc3VyZSB3ZSBkb24ndCBicmVhayBhbnl0aGluZy4KPj4+Pj4gSW4gZmFjdCwgd2UgaGF2
ZSB0cmllZCB0aGlzIGlkZWEuCj4+Pj4+Cj4+Pj4+IFRoZSBwcm9ibGVtIGlzIHRoZSBkZXRhY2gg
YW5kIHVubWFwLgo+Pj4+Pgo+Pj4+PiBXZSBuZWVkIHRvIGdldCBhbGwgRE1BIEFkZHJlc3NlcyBm
cm9tIHZpcnRpby1yaW5nIHRvIHVubWFwLiBDdXJyZW50bHksIGl0IGRvZXMKPj4+Pj4gbm90IHN1
cHBvcnQgdG8gcmV0dXJuIHRoZSBETUEgQWRkcmVzcywgYW5kIGZvciBTS0IsIHdlIG5lZWQgdG8g
Z2V0IG11bHRpcGxlIERNQQo+Pj4+PiBBZGRyZXNzZXMgYXQgb25lIHRpbWUuCj4+Pj4+Cj4+Pj4+
IFRoaXMgbmVlZCB0byBtb2RpZnkgdGhlIGxvZ2ljIG9mIFZpcnRpby1SaW5nIGRldGFjaC4gQmVz
aWRlcyB0aGlzLCBJIGFsc28gYWdyZWUKPj4+Pj4gd2l0aCB0aGlzIGlkZWEuCj4+Pj4+Cj4+Pj4+
IFRoYW5rcy4KPj4+PiBXZWxsIHlvdSBjYW4gaGF2ZSBhIHZlcnNpb24gb2YgZ2V0X2J1ZiB0aGF0
IHJldHVybnMgdGhlbSAuLi4gYnV0Cj4+Pj4gaXQgaXMgbm90IGNsZWFyIHRvIG1lIGFsbCB0aGlz
IGlzIHdvcnRoIGl0IHVubGVzcyB5b3Ugd2FudAo+Pj4+IHRvIGRvIHVuc2FmZSB0cmlja3MgbGlr
ZSBsZWF2aW5nIHRoZW0gbWFwcGVkLgo+Pj4gU29tZSBoaWdoIHNwZWVkIE5JQyBkcml2ZXJzIHVz
ZSB0aGlzIHRyaWNrIGZvciBiZXR0ZXIgcGVyZm9ybWFuY2UuCj4+Cj4+IEludGVyZXN0aW5nLCB0
aGlzIGlzIHRoZSBmaXJzdCB0aW1lIEkga25vdyB0aGlzLiBJcyB0aGVyZSBhbnkgcHJvYmxlbT8K
PiBkZXBlbmRzIC0gaWYgeW91IGFyZSByZWx5aW5nIG9uIHRoZSBJT01NVSB0aGVuIHllcyAtIG1h
bGljaW91cyBoYXJkd2FyZQo+IGNhbiBzdGVhbCBndWVzdCBzZWNyZXRzIG9yIGNvcnJ1cHQgbWVt
b3J5IHNpbmNlIGl0J3MgYSBoYWNrIG5vdCBwcm9wZXJseQo+IGludGVncmF0ZWQgd2l0aCBsaW51
eCBhbmQgdGhlcmUncyBubyByZWFsIGNvbnRyb2wgcHJldmVudGluZyBsaW51eCBmcm9tCj4gcmV1
c2luZyB0aGlzIG1lbW9yeSBmb3Igc29tZXRoaW5nIHVucmVsYXRlZC4KCgpUaGUgcGFnZXMgYXJl
IHByZS1hbGxvY2F0ZWQvbWFwcGVkIGJ1ZmZlcnMgZm9yIFJYLiBTbyBpdCBzaG91bGQgYmUgZmlu
ZS4KClRoYW5rcwoKCj4gSWYgaW5zdGVhZCB5b3UgYXJlIHVzaW5nIHNvbWV0aGluZyBsaWtlIGJv
dW5jZSBidWZmZXJzIHRoZW4gbm8sIGJ1dCBPVE9ICj4gYm91bmNlIGJ1ZmZlcnMgYXJlIGFscmVh
ZHkgZXhwZW5zaXZlIHNvIHlvdSBtaWdodCBub3Qgc2VlIGEgbG90Cj4gb2YgYmVuZWZpdC4KPgo+
PiBTbywgaXMgdGhhdCB2aXJ0aW8tbmV0IG1hc3RlciB0aGUgb3BlcmF0aW9uIG9mIGRtYSBieSBp
dHNlbGYgdGhlIHJpZ2h0IHdheT8KPj4KPj4gVGhhbmtzCj4gSSBhbSBmaW5lIHdpdGggdGhlIGFw
cHJvYWNoIHRha2VuIGZvciBub3cuIEFuZCBsb29rIGF0IHJlZHVjaW5nCj4gY29zdCBvZiBkbWEg
bWFwL3VubWFwIGxhdGVyLgo+Cj4+Cj4+Pj4gSSdkIGxlYXZlIHRoYXQKPj4+PiBmb3IgYW5vdGhl
ciBkYXkgbWF5YmUuCj4+Pj4KPj4+PiBGb3IgbWFya2luZyBkZXNjIGFzIHByZW1hcHBlZCBJIHRo
aW5rIHdlIGNhbiB1c2UgYSBiaXQgZnJvbQo+Pj4+IGRlc2NfZXh0cmEtPmZsYWdzLCBlaXRoZXIg
cmV1c2luZyBvbmUgb2YgTkVYVCxBVkFJTCxVU0VELCBvciBzdGVhbGluZwo+Pj4+IGFub3RoZXIg
b25lLgo+Pj4gUHJvYmFibHkuCj4+Pgo+Pj4gVGhhbmtzCj4+Pgo+Pj4+Cj4+Pj4KPj4+Pj4+Cj4+
Pj4+Pgo+Pj4+Pj4KPj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogWHVhbiBaaHVvIDx4dWFuemh1b0Bs
aW51eC5hbGliYWJhLmNvbT4KPj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4+ICAgZHJpdmVycy92aXJ0aW8v
dmlydGlvX3JpbmcuYyB8IDM4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQo+
Pj4+Pj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygt
KQo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aXJ0aW8vdmlydGlvX3Jp
bmcuYyBiL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19yaW5nLmMKPj4+Pj4+Pj4gaW5kZXggZTJmYzUw
YzA1YmVjLi5iZDVlODRhZmFiMzcgMTAwNjQ0Cj4+Pj4+Pj4+IC0tLSBhL2RyaXZlcnMvdmlydGlv
L3ZpcnRpb19yaW5nLmMKPj4+Pj4+Pj4gKysrIGIvZHJpdmVycy92aXJ0aW8vdmlydGlvX3Jpbmcu
Ywo+Pj4+Pj4+PiBAQCAtNzAsNiArNzAsNyBAQAo+Pj4+Pj4+PiAgIHN0cnVjdCB2cmluZ19kZXNj
X3N0YXRlX3NwbGl0IHsKPj4+Pj4+Pj4gICAgICAgICAgdm9pZCAqZGF0YTsgICAgICAgICAgICAg
ICAgICAgICAvKiBEYXRhIGZvciBjYWxsYmFjay4gKi8KPj4+Pj4+Pj4gICAgICAgICAgc3RydWN0
IHZyaW5nX2Rlc2MgKmluZGlyX2Rlc2M7ICAvKiBJbmRpcmVjdCBkZXNjcmlwdG9yLCBpZiBhbnku
ICovCj4+Pj4+Pj4+ICsgICAgICAgYm9vbCBwcmVtYXBwZWQ7ICAgICAgICAgICAgICAgICAvKiBE
TUEgbWFwcGluZyBpcyBkb25lIGJ5IGRyaXZlci4gKi8KPj4+Pj4+PiBHb2luZyBiYWNrIHRvIHRo
ZSBvcmlnaW5hbCBkaXNjdXNzaW9uIGFyb3VuZCB3aGVyZSB0aGlzIHNob3VsZCBiZQo+Pj4+Pj4+
IHBsYWNlZC4gSSB3b25kZXIgaWYgd2UgY2FuIGZpbmQgYSBjb21tb24gcGxhY2UgdG8gc3RvcmUg
dGhpcyBzaW5jZSBpdAo+Pj4+Pj4+IGhhcyBub3RoaW5nIHJlbGF0ZWQgdG8gdmlydHF1ZXVlIGxh
eW91dC4gTWF5YmUgZGVzY19leHRyYT8gQW5kIGl0Cj4+Pj4+Pj4gd291bGQgYmUgZXZlbiBiZXR0
ZXIgaWYgd2UgY2FuIGF2b2lkIHN0cmVzc2luZyB0aGUgY2FjaGUgbGlrZSBhYm92ZS4KPj4+Pj4+
Pgo+Pj4+Pj4+PiAgIH07Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+ICAgc3RydWN0IHZyaW5nX2Rlc2Nfc3Rh
dGVfcGFja2VkIHsKPj4+Pj4+Pj4gQEAgLTM1Niw4ICszNTcsMTQgQEAgc3RhdGljIHN0cnVjdCBk
ZXZpY2UgKnZyaW5nX2RtYV9kZXYoY29uc3Qgc3RydWN0IHZyaW5nX3ZpcnRxdWV1ZSAqdnEpCj4+
Pj4+Pj4+Cj4+Pj4+Pj4+ICAgLyogTWFwIG9uZSBzZyBlbnRyeS4gKi8KPj4+Pj4+Pj4gICBzdGF0
aWMgaW50IHZyaW5nX21hcF9vbmVfc2coY29uc3Qgc3RydWN0IHZyaW5nX3ZpcnRxdWV1ZSAqdnEs
IHN0cnVjdCBzY2F0dGVybGlzdCAqc2csCj4+Pj4+Pj4+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICBlbnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBkaXJlY3Rpb24sIHN0YXRpYyBkbWFfYWRkcl90
ICphZGRyKQo+Pj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgZW51bSBkbWFfZGF0
YV9kaXJlY3Rpb24gZGlyZWN0aW9uLAo+Pj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgYm9vbCBwcmVtYXBwZWQsIGRtYV9hZGRyX3QgKmFkZHIpCj4+Pj4+Pj4gaGF2aW5nIHRoaW5n
cyBsaWtlOgo+Pj4+Pj4+Cj4+Pj4+Pj4gaW50IGZ1bmMoYm9vbCBkbykKPj4+Pj4+PiB7Cj4+Pj4+
Pj4gaWYgKCFkbykKPj4+Pj4+PiAgICAgIHJldHVybjsKPj4+Pj4+PiB9Cj4+Pj4+Pj4KPj4+Pj4+
PiBpcyBhIGhpbnQgdGhhdCB0aGUgY2hlY2sgbmVlZHMgdG8gYmUgZG9uZSBieSB0aGUgY2FsbGVy
Pwo+Pj4+Pj4+Cj4+Pj4+Pj4gQW5kIHRoaXMgY2hhbmdlIHNob3VsZCB3b3JrIGZvciBib3RoIHBh
Y2tlZCBhbmQgc3BsaXQuIEkgdGhpbmsgd2UgbmVlZAo+Pj4+Pj4+IHRvIHNxdWFzaCB0aGUgcGFj
a2VkIGNoYW5nZXMgaGVyZS4KPj4+Pj4+Pgo+Pj4+Pj4+IExvb2tpbmcgYXQgaG93IHBhY2tlZCB2
aXJ0cXVldWUgdXNlcyB0aGlzIGluIHRoaXMgcGF0Y2gsIEkgZG9uJ3QgdGhpbmsKPj4+Pj4+PiB0
aGlzIHBhdGNoIGNhbiBldmVuIGJlIGJ1aWx0LiBJIHdpbGwgd2FpdCBmb3IgYSBuZXcgdmVyc2lv
biBhbmQKPj4+Pj4+PiBjb250aW51ZSB0aGUgcmV2aWV3IGZyb20gdGhlcmUuCj4+Pj4+Pj4KPj4+
Pj4+PiBUaGFua3MKPj4+Pj4+Pgo+Pj4+Pj4+Cj4+Pj4+Pj4KPj4+Pj4+Pj4gICB7Cj4+Pj4+Pj4+
ICsgICAgICAgaWYgKHByZW1hcHBlZCkgewo+Pj4+Pj4+PiArICAgICAgICAgICAgICAgKmFkZHIg
PSBzZ19kbWFfYWRkcmVzcyhzZyk7Cj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICByZXR1cm4gMDsK
Pj4+Pj4+Pj4gKyAgICAgICB9Cj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4gICAgICAgICAgaWYgKCF2cS0+
dXNlX2RtYV9hcGkpIHsKPj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAvKgo+Pj4+Pj4+PiAgICAg
ICAgICAgICAgICAgICAqIElmIERNQSBpcyBub3QgdXNlZCwgS01TQU4gZG9lc24ndCBrbm93IHRo
YXQgdGhlIHNjYXR0ZXJsaXN0Cj4+Pj4+Pj4+IEBAIC00NDUsNyArNDUyLDcgQEAgc3RhdGljIHZv
aWQgdnJpbmdfdW5tYXBfb25lX3NwbGl0X2luZGlyZWN0KGNvbnN0IHN0cnVjdCB2cmluZ192aXJ0
cXVldWUgKnZxLAo+Pj4+Pj4+PiAgIH0KPj4+Pj4+Pj4KPj4+Pj4+Pj4gICBzdGF0aWMgdW5zaWdu
ZWQgaW50IHZyaW5nX3VubWFwX29uZV9zcGxpdChjb25zdCBzdHJ1Y3QgdnJpbmdfdmlydHF1ZXVl
ICp2cSwKPj4+Pj4+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dW5zaWduZWQgaW50IGkpCj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHVuc2lnbmVkIGludCBpLCBib29sIHByZW1hcHBlZCkKPj4+Pj4+Pj4gICB7Cj4+
Pj4+Pj4+ICAgICAgICAgIHN0cnVjdCB2cmluZ19kZXNjX2V4dHJhICpleHRyYSA9IHZxLT5zcGxp
dC5kZXNjX2V4dHJhOwo+Pj4+Pj4+PiAgICAgICAgICB1MTYgZmxhZ3M7Cj4+Pj4+Pj4+IEBAIC00
NjIsNiArNDY5LDkgQEAgc3RhdGljIHVuc2lnbmVkIGludCB2cmluZ191bm1hcF9vbmVfc3BsaXQo
Y29uc3Qgc3RydWN0IHZyaW5nX3ZpcnRxdWV1ZSAqdnEsCj4+Pj4+Pj4+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAoZmxhZ3MgJiBWUklOR19ERVNDX0ZfV1JJVEUpID8KPj4+Pj4+
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERNQV9GUk9NX0RFVklDRSA6IERN
QV9UT19ERVZJQ0UpOwo+Pj4+Pj4+PiAgICAgICAgICB9IGVsc2Ugewo+Pj4+Pj4+PiArICAgICAg
ICAgICAgICAgaWYgKHByZW1hcHBlZCkKPj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAg
Z290byBvdXQ7Cj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4gICAgICAgICAgICAgICAgICBkbWFfdW5tYXBf
cGFnZSh2cmluZ19kbWFfZGV2KHZxKSwKPj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBleHRyYVtpXS5hZGRyLAo+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGV4dHJhW2ldLmxlbiwKPj4+Pj4+Pj4gQEAgLTUzMiw2ICs1NDIsNyBAQCBzdGF0aWMg
aW5saW5lIGludCB2aXJ0cXVldWVfYWRkX3NwbGl0KHN0cnVjdCB2aXJ0cXVldWUgKl92cSwKPj4+
Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50
IGluX3NncywKPj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dm9pZCAqZGF0YSwKPj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdm9pZCAqY3R4LAo+Pj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGJvb2wgcHJlbWFwcGVkLAo+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBnZnBfdCBnZnApCj4+Pj4+Pj4+ICAgewo+Pj4+Pj4+PiAgICAgICAgICBzdHJ1
Y3QgdnJpbmdfdmlydHF1ZXVlICp2cSA9IHRvX3Z2cShfdnEpOwo+Pj4+Pj4+PiBAQCAtNTk1LDcg
KzYwNiw3IEBAIHN0YXRpYyBpbmxpbmUgaW50IHZpcnRxdWV1ZV9hZGRfc3BsaXQoc3RydWN0IHZp
cnRxdWV1ZSAqX3ZxLAo+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgIGZvciAoc2cgPSBzZ3Nbbl07
IHNnOyBzZyA9IHNnX25leHQoc2cpKSB7Cj4+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICBkbWFfYWRkcl90IGFkZHI7Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IC0gICAgICAgICAgICAgICAgICAg
ICAgIGlmICh2cmluZ19tYXBfb25lX3NnKHZxLCBzZywgRE1BX1RPX0RFVklDRSwgJmFkZHIpKQo+
Pj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICBpZiAodnJpbmdfbWFwX29uZV9zZyh2cSwg
c2csIERNQV9UT19ERVZJQ0UsIHByZW1hcHBlZCwgJmFkZHIpKQo+Pj4+Pj4+PiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBnb3RvIHVubWFwX3JlbGVhc2U7Cj4+Pj4+Pj4+Cj4+Pj4+
Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICBwcmV2ID0gaTsKPj4+Pj4+Pj4gQEAgLTYxMSw3
ICs2MjIsNyBAQCBzdGF0aWMgaW5saW5lIGludCB2aXJ0cXVldWVfYWRkX3NwbGl0KHN0cnVjdCB2
aXJ0cXVldWUgKl92cSwKPj4+Pj4+Pj4gICAgICAgICAgICAgICAgICBmb3IgKHNnID0gc2dzW25d
OyBzZzsgc2cgPSBzZ19uZXh0KHNnKSkgewo+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgZG1hX2FkZHJfdCBhZGRyOwo+Pj4+Pj4+Pgo+Pj4+Pj4+PiAtICAgICAgICAgICAgICAgICAg
ICAgICBpZiAodnJpbmdfbWFwX29uZV9zZyh2cSwgc2csIERNQV9GUk9NX0RFVklDRSwgJmFkZHIp
KQo+Pj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICBpZiAodnJpbmdfbWFwX29uZV9zZyh2
cSwgc2csIERNQV9GUk9NX0RFVklDRSwgcHJlbWFwcGVkLCAmYWRkcikpCj4+Pj4+Pj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gdW5tYXBfcmVsZWFzZTsKPj4+Pj4+Pj4K
Pj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgIHByZXYgPSBpOwo+Pj4+Pj4+PiBAQCAt
NjU3LDYgKzY2OCw3IEBAIHN0YXRpYyBpbmxpbmUgaW50IHZpcnRxdWV1ZV9hZGRfc3BsaXQoc3Ry
dWN0IHZpcnRxdWV1ZSAqX3ZxLAo+Pj4+Pj4+Pgo+Pj4+Pj4+PiAgICAgICAgICAvKiBTdG9yZSB0
b2tlbiBhbmQgaW5kaXJlY3QgYnVmZmVyIHN0YXRlLiAqLwo+Pj4+Pj4+PiAgICAgICAgICB2cS0+
c3BsaXQuZGVzY19zdGF0ZVtoZWFkXS5kYXRhID0gZGF0YTsKPj4+Pj4+Pj4gKyAgICAgICB2cS0+
c3BsaXQuZGVzY19zdGF0ZVtoZWFkXS5wcmVtYXBwZWQgPSBwcmVtYXBwZWQ7Cj4+Pj4+Pj4+ICAg
ICAgICAgIGlmIChpbmRpcmVjdCkKPj4+Pj4+Pj4gICAgICAgICAgICAgICAgICB2cS0+c3BsaXQu
ZGVzY19zdGF0ZVtoZWFkXS5pbmRpcl9kZXNjID0gZGVzYzsKPj4+Pj4+Pj4gICAgICAgICAgZWxz
ZQo+Pj4+Pj4+PiBAQCAtNjg2LDYgKzY5OCwxNCBAQCBzdGF0aWMgaW5saW5lIGludCB2aXJ0cXVl
dWVfYWRkX3NwbGl0KHN0cnVjdCB2aXJ0cXVldWUgKl92cSwKPj4+Pj4+Pj4gICAgICAgICAgcmV0
dXJuIDA7Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+ICAgdW5tYXBfcmVsZWFzZToKPj4+Pj4+Pj4gKyAgICAg
ICBpZiAocHJlbWFwcGVkKSB7Cj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICBpZiAoaW5kaXJlY3Qp
Cj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGtmcmVlKGRlc2MpOwo+Pj4+Pj4+PiAr
Cj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICBFTkRfVVNFKHZxKTsKPj4+Pj4+Pj4gKyAgICAgICAg
ICAgICAgIHJldHVybiAtRU5PTUVNOwo+Pj4+Pj4+PiArICAgICAgIH0KPj4+Pj4+Pj4gKwo+Pj4+
Pj4+PiAgICAgICAgICBlcnJfaWR4ID0gaTsKPj4+Pj4+Pj4KPj4+Pj4+Pj4gICAgICAgICAgaWYg
KGluZGlyZWN0KQo+Pj4+Pj4+PiBAQCAtNzAwLDcgKzcyMCw3IEBAIHN0YXRpYyBpbmxpbmUgaW50
IHZpcnRxdWV1ZV9hZGRfc3BsaXQoc3RydWN0IHZpcnRxdWV1ZSAqX3ZxLAo+Pj4+Pj4+PiAgICAg
ICAgICAgICAgICAgICAgICAgICAgdnJpbmdfdW5tYXBfb25lX3NwbGl0X2luZGlyZWN0KHZxLCAm
ZGVzY1tpXSk7Cj4+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICBpID0gdmlydGlvMTZf
dG9fY3B1KF92cS0+dmRldiwgZGVzY1tpXS5uZXh0KTsKPj4+Pj4+Pj4gICAgICAgICAgICAgICAg
ICB9IGVsc2UKPj4+Pj4+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgaSA9IHZyaW5nX3VubWFw
X29uZV9zcGxpdCh2cSwgaSk7Cj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGkgPSB2
cmluZ191bm1hcF9vbmVfc3BsaXQodnEsIGksIGZhbHNlKTsKPj4+Pj4+Pj4gICAgICAgICAgfQo+
Pj4+Pj4+Pgo+Pj4+Pj4+PiAgICAgICAgICBpZiAoaW5kaXJlY3QpCj4+Pj4+Pj4+IEBAIC03NTcs
MTIgKzc3NywxMiBAQCBzdGF0aWMgdm9pZCBkZXRhY2hfYnVmX3NwbGl0KHN0cnVjdCB2cmluZ192
aXJ0cXVldWUgKnZxLCB1bnNpZ25lZCBpbnQgaGVhZCwKPj4+Pj4+Pj4gICAgICAgICAgaSA9IGhl
YWQ7Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+ICAgICAgICAgIHdoaWxlICh2cS0+c3BsaXQudnJpbmcuZGVz
Y1tpXS5mbGFncyAmIG5leHRmbGFnKSB7Cj4+Pj4+Pj4+IC0gICAgICAgICAgICAgICB2cmluZ191
bm1hcF9vbmVfc3BsaXQodnEsIGkpOwo+Pj4+Pj4+PiArICAgICAgICAgICAgICAgdnJpbmdfdW5t
YXBfb25lX3NwbGl0KHZxLCBpLCBzdGF0ZS0+cHJlbWFwcGVkKTsKPj4+Pj4+Pj4gICAgICAgICAg
ICAgICAgICBpID0gdnEtPnNwbGl0LmRlc2NfZXh0cmFbaV0ubmV4dDsKPj4+Pj4+Pj4gICAgICAg
ICAgICAgICAgICB2cS0+dnEubnVtX2ZyZWUrKzsKPj4+Pj4+Pj4gICAgICAgICAgfQo+Pj4+Pj4+
Pgo+Pj4+Pj4+PiAtICAgICAgIHZyaW5nX3VubWFwX29uZV9zcGxpdCh2cSwgaSk7Cj4+Pj4+Pj4+
ICsgICAgICAgdnJpbmdfdW5tYXBfb25lX3NwbGl0KHZxLCBpLCBzdGF0ZS0+cHJlbWFwcGVkKTsK
Pj4+Pj4+Pj4gICAgICAgICAgdnEtPnNwbGl0LmRlc2NfZXh0cmFbaV0ubmV4dCA9IHZxLT5mcmVl
X2hlYWQ7Cj4+Pj4+Pj4+ICAgICAgICAgIHZxLT5mcmVlX2hlYWQgPSBoZWFkOwo+Pj4+Pj4+Pgo+
Pj4+Pj4+PiBAQCAtNzgzLDcgKzgwMyw3IEBAIHN0YXRpYyB2b2lkIGRldGFjaF9idWZfc3BsaXQo
c3RydWN0IHZyaW5nX3ZpcnRxdWV1ZSAqdnEsIHVuc2lnbmVkIGludCBoZWFkLAo+Pj4+Pj4+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBWUklOR19ERVNDX0ZfSU5ESVJFQ1QpKTsK
Pj4+Pj4+Pj4gICAgICAgICAgICAgICAgICBCVUdfT04obGVuID09IDAgfHwgbGVuICUgc2l6ZW9m
KHN0cnVjdCB2cmluZ19kZXNjKSk7Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IC0gICAgICAgICAgICAgICBp
ZiAodnEtPnVzZV9kbWFfYXBpKSB7Cj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICBpZiAodnEtPnVz
ZV9kbWFfYXBpICYmICFzdGF0ZS0+cHJlbWFwcGVkKSB7Cj4+Pj4+Pj4+ICAgICAgICAgICAgICAg
ICAgICAgICAgICBmb3IgKGogPSAwOyBqIDwgbGVuIC8gc2l6ZW9mKHN0cnVjdCB2cmluZ19kZXNj
KTsgaisrKQo+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2cmluZ191
bm1hcF9vbmVfc3BsaXRfaW5kaXJlY3QodnEsICZpbmRpcl9kZXNjW2pdKTsKPj4+Pj4+Pj4gICAg
ICAgICAgICAgICAgICB9Cj4+Pj4+Pj4+IEBAIC0yMTQzLDcgKzIxNjMsNyBAQCBzdGF0aWMgaW5s
aW5lIGludCB2aXJ0cXVldWVfYWRkKHN0cnVjdCB2aXJ0cXVldWUgKl92cSwKPj4+Pj4+Pj4gICAg
ICAgICAgcmV0dXJuIHZxLT5wYWNrZWRfcmluZyA/IHZpcnRxdWV1ZV9hZGRfcGFja2VkKF92cSwg
c2dzLCB0b3RhbF9zZywKPj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBvdXRfc2dzLCBpbl9zZ3MsIGRhdGEsIGN0eCwgZ2ZwKSA6Cj4+Pj4+Pj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2aXJ0cXVldWVfYWRkX3NwbGl0KF92cSwgc2dz
LCB0b3RhbF9zZywKPj4+Pj4+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIG91dF9zZ3MsIGluX3NncywgZGF0YSwgY3R4LCBnZnApOwo+Pj4+Pj4+PiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgb3V0X3NncywgaW5fc2dzLCBkYXRhLCBjdHgs
IHByZW1hcHBlZCwgZ2ZwKTsKPj4+Pj4+Pj4gICB9Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+ICAgLyoqCj4+
Pj4+Pj4+IC0tCj4+Pj4+Pj4+IDIuMzIuMC4zLmcwMTE5NWNmOWYKPj4+Pj4+Pj4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1h
aWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXph
dGlvbg==
