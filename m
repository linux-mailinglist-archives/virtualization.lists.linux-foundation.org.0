Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FC2707D4A
	for <lists.virtualization@lfdr.de>; Thu, 18 May 2023 11:52:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F7706FF70;
	Thu, 18 May 2023 09:52:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F7706FF70
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MAYTOnbM
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tW7nLdGv-hDC; Thu, 18 May 2023 09:52:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 65CC26FF4C;
	Thu, 18 May 2023 09:52:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65CC26FF4C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 94446C0037;
	Thu, 18 May 2023 09:52:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 839B9C002A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 May 2023 09:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A2DC84078
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 May 2023 09:49:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A2DC84078
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=MAYTOnbM
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 33jD3sRJpisV
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 May 2023 09:49:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DD8D84426
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5DD8D84426
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 May 2023 09:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684403393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7rXaDPqBdu9vU1rPTPqpWFmppLtofytlA+dTCqGjyv0=;
 b=MAYTOnbMKBtmenX2dsQT/0ygzAYU9gc2CITzq7ZyL1/6sYCP/6N9yqq7y6RqrcE+thIgww
 vYT94qtJikuCA0/PYBOVWplxhh2zK5EeNT43kakrWKP2ifLoRd2WZAXK7icUqrsqNRrE6x
 qUzmhNaRlLXVXFUoatvIWZKEuEKynak=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-375-5GLwlRz0MRKzQbDs7e7TwA-1; Thu, 18 May 2023 05:49:52 -0400
X-MC-Unique: 5GLwlRz0MRKzQbDs7e7TwA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f42b226871so7633925e9.0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 May 2023 02:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684403391; x=1686995391;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7rXaDPqBdu9vU1rPTPqpWFmppLtofytlA+dTCqGjyv0=;
 b=QhgtY/wKYx4Cgsv34hPERmdWeQ7YWBBd4pn9tUWPWEovre5vOGFFNr9pAJ6dsi0g3y
 nFH5xnbfsxwmV8RkqZVd667hjVY3jt/mtCO/+aGfxXQshaARCyR+N1OeZ07El+FidmLv
 Jv0PWrC298eXUoWr7YS10x8bTle/PUCcU1O3NbGDO2Jd6ImbnK/stNZQ3T4x9e7M9FSz
 5WF/E7ngis5t4PDClqWuldoV/7smePCsY2xnyFyYiFLxWAm8Rn6pbYNM1oujA+fVHM/p
 p9YOAS70NleZ8m5m+YG8FXhtwY2+EwyjBu1Fcf1xoOfCM13go5J/F/LjH+OQh2xF5AHI
 ikJQ==
X-Gm-Message-State: AC+VfDxlRQRs7EB6KXnE8NpabSnf53rXbvsYaM8pAtWS4XiYQm+FMGF0
 m5TeO2scjnRSi1BW5kDDd8yZWlAomB0WZSTPDsLGZjCdgU43DWlY3QFqQVuQYQwmU+P4tMxQl+t
 8payAG3zyj8732gXQ/jFSSePKYQ3u6TZpdUOTvINBfg==
X-Received: by 2002:a7b:cd8c:0:b0:3f4:27d5:a6dc with SMTP id
 y12-20020a7bcd8c000000b003f427d5a6dcmr1082013wmj.31.1684403390788; 
 Thu, 18 May 2023 02:49:50 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7v1rOuCdrY64ZPHi9DLtct8LEXP28PrBEy3aRdcg6uCghT/UAg0c9KRIr7ZapHQej03a93cw==
X-Received: by 2002:a7b:cd8c:0:b0:3f4:27d5:a6dc with SMTP id
 y12-20020a7bcd8c000000b003f427d5a6dcmr1081995wmj.31.1684403390404; 
 Thu, 18 May 2023 02:49:50 -0700 (PDT)
Received: from redhat.com ([2.52.6.43]) by smtp.gmail.com with ESMTPSA id
 11-20020a05600c268b00b003f423dfc686sm1469576wmt.45.2023.05.18.02.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 May 2023 02:49:49 -0700 (PDT)
Date: Thu, 18 May 2023 05:49:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH vhost v9 05/12] virtio_ring: split: virtqueue_add_split()
 support premapped
Message-ID: <20230518054517-mutt-send-email-mst@kernel.org>
References: <20230517022249.20790-1-xuanzhuo@linux.alibaba.com>
 <20230517022249.20790-6-xuanzhuo@linux.alibaba.com>
 <CACGkMEu7+kDPiWmULXW_saW6pb5yF=gnqXRkSWcYbZCiJmszHQ@mail.gmail.com>
 <20230518030701-mutt-send-email-mst@kernel.org>
 <1684395232.2129312-1-xuanzhuo@linux.alibaba.com>
 <20230518041446-mutt-send-email-mst@kernel.org>
 <CACGkMEso-pDo_sDN_nCR95WSOh32wtUQAfWLy69tOyXr7EA9_g@mail.gmail.com>
 <1684401243.4437356-2-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <1684401243.4437356-2-xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gVGh1LCBNYXkgMTgsIDIwMjMgYXQgMDU6MTQ6MDNQTSArMDgwMCwgWHVhbiBaaHVvIHdyb3Rl
Ogo+IE9uIFRodSwgMTggTWF5IDIwMjMgMTY6NTc6MzcgKzA4MDAsIEphc29uIFdhbmcgPGphc293
YW5nQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4gT24gVGh1LCBNYXkgMTgsIDIwMjMgYXQgNDoyOeKA
r1BNIE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+IHdyb3RlOgo+ID4gPgo+ID4g
PiBPbiBUaHUsIE1heSAxOCwgMjAyMyBhdCAwMzozMzo1MlBNICswODAwLCBYdWFuIFpodW8gd3Jv
dGU6Cj4gPiA+ID4gT24gVGh1LCAxOCBNYXkgMjAyMyAwMzoxMToyNSAtMDQwMCwgIk1pY2hhZWwg
Uy4gVHNpcmtpbiIgPG1zdEByZWRoYXQuY29tPiB3cm90ZToKPiA+ID4gPiA+IE9uIFRodSwgTWF5
IDE4LCAyMDIzIGF0IDAyOjUxOjU3UE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4gPiA+ID4g
PiA+IE9uIFdlZCwgTWF5IDE3LCAyMDIzIGF0IDEwOjIz4oCvQU0gWHVhbiBaaHVvIDx4dWFuemh1
b0BsaW51eC5hbGliYWJhLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiB2
aXJ0cXVldWVfYWRkX3NwbGl0KCkgb25seSBzdXBwb3J0cyB2aXJ0dWFsIGFkZHJlc3NlcywgZG1h
IGlzIGNvbXBsZXRlZAo+ID4gPiA+ID4gPiA+IGluIHZpcnRxdWV1ZV9hZGRfc3BsaXQoKS4KPiA+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IEluIHNvbWUgc2NlbmFyaW9zIChzdWNoIGFzIHRoZSBB
Rl9YRFAgc2NlbmFyaW8pLCB0aGUgbWVtb3J5IGlzIGFsbG9jYXRlZAo+ID4gPiA+ID4gPiA+IGFu
ZCBETUEgaXMgY29tcGxldGVkIGluIGFkdmFuY2UsIHNvIGl0IGlzIG5lY2Vzc2FyeSBmb3IgdXMg
dG8gc3VwcG9ydAo+ID4gPiA+ID4gPiA+IHBhc3NpbmcgdGhlIERNQSBhZGRyZXNzIHRvIHZpcnRx
dWV1ZV9hZGRfc3BsaXQoKS4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IFJlY29yZCB0aGlz
IGluZm9ybWF0aW9uIGluIGRlc2Nfc3RhdGUsIHdlIGNhbiBza2lwIHVubWFwIGJhc2VkIG9uIHRo
aXMKPiA+ID4gPiA+ID4gPiB3aGVuIGV4ZWN1dGluZyBkbWEgdW5tYXAuCj4gPiA+ID4gPiA+Cj4g
PiA+ID4gPiA+IEkgd291bGQgYWxzbyBzdWdnZXN0IGRvY3VtZW50aW5nIHdoeSBhIHBlciBkZXNj
cmlwdG9yIG1ldGFkYXRhIGlzCj4gPiA+ID4gPiA+IG5lZWRlZCBpbnN0ZWFkIG9mIGEgcGVyIHZp
cnRxdWV1ZSBvbmUuCj4gPiA+ID4gPgo+ID4gPiA+ID4gSSB0aGluayB3ZSBjb3VsZCBtYWtlIGl0
IHBlciB2aXJ0cXVldWUuIFRoYXQgd291bGQgbWVhbiBhbGwgY29kZSBpbgo+ID4gPiA+ID4gdmly
dGlvIG5ldCB3b3VsZCBoYXZlIHRvIGNoYW5nZSB0byBkbyBkbWEgbWFwcGluZyBpdHNlbGYgaW5z
dGVhZCBvZgo+ID4gPiA+ID4gcmVseWluZyBvbiB2aXJ0aW8gY29yZSB0aG91Z2guICBXaGljaCBp
cyBtYXliZSBhIGdvb2QgaWRlYT8gRGVmaW5pdGVseSBhCj4gPiA+ID4gPiB2ZXJ5IGludHJ1c2l2
ZSBjaGFuZ2UgdGhvdWdoLCB3aWxsIG5lZWQgYSBsb3Qgb2YgcGVyZm9ybWFuY2UgdGVzdGluZwo+
ID4gPiA+ID4gdG8gbWFrZSBzdXJlIHdlIGRvbid0IGJyZWFrIGFueXRoaW5nLgo+ID4gPiA+Cj4g
PiA+ID4gSW4gZmFjdCwgd2UgaGF2ZSB0cmllZCB0aGlzIGlkZWEuCj4gPiA+ID4KPiA+ID4gPiBU
aGUgcHJvYmxlbSBpcyB0aGUgZGV0YWNoIGFuZCB1bm1hcC4KPiA+ID4gPgo+ID4gPiA+IFdlIG5l
ZWQgdG8gZ2V0IGFsbCBETUEgQWRkcmVzc2VzIGZyb20gdmlydGlvLXJpbmcgdG8gdW5tYXAuIEN1
cnJlbnRseSwgaXQgZG9lcwo+ID4gPiA+IG5vdCBzdXBwb3J0IHRvIHJldHVybiB0aGUgRE1BIEFk
ZHJlc3MsIGFuZCBmb3IgU0tCLCB3ZSBuZWVkIHRvIGdldCBtdWx0aXBsZSBETUEKPiA+ID4gPiBB
ZGRyZXNzZXMgYXQgb25lIHRpbWUuCj4gPiA+ID4KPiA+ID4gPiBUaGlzIG5lZWQgdG8gbW9kaWZ5
IHRoZSBsb2dpYyBvZiBWaXJ0aW8tUmluZyBkZXRhY2guIEJlc2lkZXMgdGhpcywgSSBhbHNvIGFn
cmVlCj4gPiA+ID4gd2l0aCB0aGlzIGlkZWEuCj4gPiA+ID4KPiA+ID4gPiBUaGFua3MuCj4gPiA+
Cj4gPiA+IFdlbGwgeW91IGNhbiBoYXZlIGEgdmVyc2lvbiBvZiBnZXRfYnVmIHRoYXQgcmV0dXJu
cyB0aGVtIC4uLiBidXQKPiA+ID4gaXQgaXMgbm90IGNsZWFyIHRvIG1lIGFsbCB0aGlzIGlzIHdv
cnRoIGl0IHVubGVzcyB5b3Ugd2FudAo+ID4gPiB0byBkbyB1bnNhZmUgdHJpY2tzIGxpa2UgbGVh
dmluZyB0aGVtIG1hcHBlZC4KPiA+Cj4gPiBTb21lIGhpZ2ggc3BlZWQgTklDIGRyaXZlcnMgdXNl
IHRoaXMgdHJpY2sgZm9yIGJldHRlciBwZXJmb3JtYW5jZS4KPiAKPiAKPiBJbnRlcmVzdGluZywg
dGhpcyBpcyB0aGUgZmlyc3QgdGltZSBJIGtub3cgdGhpcy4gSXMgdGhlcmUgYW55IHByb2JsZW0/
CgpkZXBlbmRzIC0gaWYgeW91IGFyZSByZWx5aW5nIG9uIHRoZSBJT01NVSB0aGVuIHllcyAtIG1h
bGljaW91cyBoYXJkd2FyZQpjYW4gc3RlYWwgZ3Vlc3Qgc2VjcmV0cyBvciBjb3JydXB0IG1lbW9y
eSBzaW5jZSBpdCdzIGEgaGFjayBub3QgcHJvcGVybHkKaW50ZWdyYXRlZCB3aXRoIGxpbnV4IGFu
ZCB0aGVyZSdzIG5vIHJlYWwgY29udHJvbCBwcmV2ZW50aW5nIGxpbnV4IGZyb20KcmV1c2luZyB0
aGlzIG1lbW9yeSBmb3Igc29tZXRoaW5nIHVucmVsYXRlZC4KSWYgaW5zdGVhZCB5b3UgYXJlIHVz
aW5nIHNvbWV0aGluZyBsaWtlIGJvdW5jZSBidWZmZXJzIHRoZW4gbm8sIGJ1dCBPVE9ICmJvdW5j
ZSBidWZmZXJzIGFyZSBhbHJlYWR5IGV4cGVuc2l2ZSBzbyB5b3UgbWlnaHQgbm90IHNlZSBhIGxv
dApvZiBiZW5lZml0LgoKPiBTbywgaXMgdGhhdCB2aXJ0aW8tbmV0IG1hc3RlciB0aGUgb3BlcmF0
aW9uIG9mIGRtYSBieSBpdHNlbGYgdGhlIHJpZ2h0IHdheT8KPiAKPiBUaGFua3MKCkkgYW0gZmlu
ZSB3aXRoIHRoZSBhcHByb2FjaCB0YWtlbiBmb3Igbm93LiBBbmQgbG9vayBhdCByZWR1Y2luZwpj
b3N0IG9mIGRtYSBtYXAvdW5tYXAgbGF0ZXIuCgo+IAo+IAo+ID4KPiA+ID4gSSdkIGxlYXZlIHRo
YXQKPiA+ID4gZm9yIGFub3RoZXIgZGF5IG1heWJlLgo+ID4gPgo+ID4gPiBGb3IgbWFya2luZyBk
ZXNjIGFzIHByZW1hcHBlZCBJIHRoaW5rIHdlIGNhbiB1c2UgYSBiaXQgZnJvbQo+ID4gPiBkZXNj
X2V4dHJhLT5mbGFncywgZWl0aGVyIHJldXNpbmcgb25lIG9mIE5FWFQsQVZBSUwsVVNFRCwgb3Ig
c3RlYWxpbmcKPiA+ID4gYW5vdGhlciBvbmUuCj4gPgo+ID4gUHJvYmFibHkuCj4gPgo+ID4gVGhh
bmtzCj4gPgo+ID4gPgo+ID4gPgo+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gPgo+ID4gPiA+ID4KPiA+
ID4gPiA+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1i
eTogWHVhbiBaaHVvIDx4dWFuemh1b0BsaW51eC5hbGliYWJhLmNvbT4KPiA+ID4gPiA+ID4gPiAt
LS0KPiA+ID4gPiA+ID4gPiAgZHJpdmVycy92aXJ0aW8vdmlydGlvX3JpbmcuYyB8IDM4ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQo+ID4gPiA+ID4gPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPiA+ID4gPiA+ID4gPgo+ID4g
PiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jIGIvZHJp
dmVycy92aXJ0aW8vdmlydGlvX3JpbmcuYwo+ID4gPiA+ID4gPiA+IGluZGV4IGUyZmM1MGMwNWJl
Yy4uYmQ1ZTg0YWZhYjM3IDEwMDY0NAo+ID4gPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvdmlydGlv
L3ZpcnRpb19yaW5nLmMKPiA+ID4gPiA+ID4gPiArKysgYi9kcml2ZXJzL3ZpcnRpby92aXJ0aW9f
cmluZy5jCj4gPiA+ID4gPiA+ID4gQEAgLTcwLDYgKzcwLDcgQEAKPiA+ID4gPiA+ID4gPiAgc3Ry
dWN0IHZyaW5nX2Rlc2Nfc3RhdGVfc3BsaXQgewo+ID4gPiA+ID4gPiA+ICAgICAgICAgdm9pZCAq
ZGF0YTsgICAgICAgICAgICAgICAgICAgICAvKiBEYXRhIGZvciBjYWxsYmFjay4gKi8KPiA+ID4g
PiA+ID4gPiAgICAgICAgIHN0cnVjdCB2cmluZ19kZXNjICppbmRpcl9kZXNjOyAgLyogSW5kaXJl
Y3QgZGVzY3JpcHRvciwgaWYgYW55LiAqLwo+ID4gPiA+ID4gPiA+ICsgICAgICAgYm9vbCBwcmVt
YXBwZWQ7ICAgICAgICAgICAgICAgICAvKiBETUEgbWFwcGluZyBpcyBkb25lIGJ5IGRyaXZlci4g
Ki8KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gR29pbmcgYmFjayB0byB0aGUgb3JpZ2luYWwgZGlz
Y3Vzc2lvbiBhcm91bmQgd2hlcmUgdGhpcyBzaG91bGQgYmUKPiA+ID4gPiA+ID4gcGxhY2VkLiBJ
IHdvbmRlciBpZiB3ZSBjYW4gZmluZCBhIGNvbW1vbiBwbGFjZSB0byBzdG9yZSB0aGlzIHNpbmNl
IGl0Cj4gPiA+ID4gPiA+IGhhcyBub3RoaW5nIHJlbGF0ZWQgdG8gdmlydHF1ZXVlIGxheW91dC4g
TWF5YmUgZGVzY19leHRyYT8gQW5kIGl0Cj4gPiA+ID4gPiA+IHdvdWxkIGJlIGV2ZW4gYmV0dGVy
IGlmIHdlIGNhbiBhdm9pZCBzdHJlc3NpbmcgdGhlIGNhY2hlIGxpa2UgYWJvdmUuCj4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+ID4gIH07Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiAgc3RydWN0
IHZyaW5nX2Rlc2Nfc3RhdGVfcGFja2VkIHsKPiA+ID4gPiA+ID4gPiBAQCAtMzU2LDggKzM1Nywx
NCBAQCBzdGF0aWMgc3RydWN0IGRldmljZSAqdnJpbmdfZG1hX2Rldihjb25zdCBzdHJ1Y3QgdnJp
bmdfdmlydHF1ZXVlICp2cSkKPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ICAvKiBNYXAgb25l
IHNnIGVudHJ5LiAqLwo+ID4gPiA+ID4gPiA+ICBzdGF0aWMgaW50IHZyaW5nX21hcF9vbmVfc2co
Y29uc3Qgc3RydWN0IHZyaW5nX3ZpcnRxdWV1ZSAqdnEsIHN0cnVjdCBzY2F0dGVybGlzdCAqc2cs
Cj4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgIGVudW0gZG1hX2RhdGFf
ZGlyZWN0aW9uIGRpcmVjdGlvbiwgc3RhdGljIGRtYV9hZGRyX3QgKmFkZHIpCj4gPiA+ID4gPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIGVudW0gZG1hX2RhdGFfZGlyZWN0aW9uIGRp
cmVjdGlvbiwKPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCBw
cmVtYXBwZWQsIGRtYV9hZGRyX3QgKmFkZHIpCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IGhhdmlu
ZyB0aGluZ3MgbGlrZToKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gaW50IGZ1bmMoYm9vbCBkbykK
PiA+ID4gPiA+ID4gewo+ID4gPiA+ID4gPiBpZiAoIWRvKQo+ID4gPiA+ID4gPiAgICAgcmV0dXJu
Owo+ID4gPiA+ID4gPiB9Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IGlzIGEgaGludCB0aGF0IHRo
ZSBjaGVjayBuZWVkcyB0byBiZSBkb25lIGJ5IHRoZSBjYWxsZXI/Cj4gPiA+ID4gPiA+Cj4gPiA+
ID4gPiA+IEFuZCB0aGlzIGNoYW5nZSBzaG91bGQgd29yayBmb3IgYm90aCBwYWNrZWQgYW5kIHNw
bGl0LiBJIHRoaW5rIHdlIG5lZWQKPiA+ID4gPiA+ID4gdG8gc3F1YXNoIHRoZSBwYWNrZWQgY2hh
bmdlcyBoZXJlLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBMb29raW5nIGF0IGhvdyBwYWNrZWQg
dmlydHF1ZXVlIHVzZXMgdGhpcyBpbiB0aGlzIHBhdGNoLCBJIGRvbid0IHRoaW5rCj4gPiA+ID4g
PiA+IHRoaXMgcGF0Y2ggY2FuIGV2ZW4gYmUgYnVpbHQuIEkgd2lsbCB3YWl0IGZvciBhIG5ldyB2
ZXJzaW9uIGFuZAo+ID4gPiA+ID4gPiBjb250aW51ZSB0aGUgcmV2aWV3IGZyb20gdGhlcmUuCj4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFRoYW5rcwo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPgo+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPiA+ICB7Cj4gPiA+ID4gPiA+ID4gKyAgICAgICBpZiAocHJlbWFw
cGVkKSB7Cj4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICphZGRyID0gc2dfZG1hX2FkZHJl
c3Moc2cpOwo+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gMDsKPiA+ID4gPiA+
ID4gPiArICAgICAgIH0KPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gICAgICAgICBpZiAo
IXZxLT51c2VfZG1hX2FwaSkgewo+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAvKgo+ID4g
PiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgKiBJZiBETUEgaXMgbm90IHVzZWQsIEtNU0FOIGRv
ZXNuJ3Qga25vdyB0aGF0IHRoZSBzY2F0dGVybGlzdAo+ID4gPiA+ID4gPiA+IEBAIC00NDUsNyAr
NDUyLDcgQEAgc3RhdGljIHZvaWQgdnJpbmdfdW5tYXBfb25lX3NwbGl0X2luZGlyZWN0KGNvbnN0
IHN0cnVjdCB2cmluZ192aXJ0cXVldWUgKnZxLAo+ID4gPiA+ID4gPiA+ICB9Cj4gPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gPiAgc3RhdGljIHVuc2lnbmVkIGludCB2cmluZ191bm1hcF9vbmVfc3Bs
aXQoY29uc3Qgc3RydWN0IHZyaW5nX3ZpcnRxdWV1ZSAqdnEsCj4gPiA+ID4gPiA+ID4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGkpCj4gPiA+
ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWdu
ZWQgaW50IGksIGJvb2wgcHJlbWFwcGVkKQo+ID4gPiA+ID4gPiA+ICB7Cj4gPiA+ID4gPiA+ID4g
ICAgICAgICBzdHJ1Y3QgdnJpbmdfZGVzY19leHRyYSAqZXh0cmEgPSB2cS0+c3BsaXQuZGVzY19l
eHRyYTsKPiA+ID4gPiA+ID4gPiAgICAgICAgIHUxNiBmbGFnczsKPiA+ID4gPiA+ID4gPiBAQCAt
NDYyLDYgKzQ2OSw5IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgdnJpbmdfdW5tYXBfb25lX3NwbGl0
KGNvbnN0IHN0cnVjdCB2cmluZ192aXJ0cXVldWUgKnZxLAo+ID4gPiA+ID4gPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIChmbGFncyAmIFZSSU5HX0RFU0NfRl9XUklURSkgPwo+
ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERNQV9GUk9NX0RF
VklDRSA6IERNQV9UT19ERVZJQ0UpOwo+ID4gPiA+ID4gPiA+ICAgICAgICAgfSBlbHNlIHsKPiA+
ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgaWYgKHByZW1hcHBlZCkKPiA+ID4gPiA+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsKPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4g
PiA+ID4gICAgICAgICAgICAgICAgIGRtYV91bm1hcF9wYWdlKHZyaW5nX2RtYV9kZXYodnEpLAo+
ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBleHRyYVtpXS5hZGRy
LAo+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBleHRyYVtpXS5s
ZW4sCj4gPiA+ID4gPiA+ID4gQEAgLTUzMiw2ICs1NDIsNyBAQCBzdGF0aWMgaW5saW5lIGludCB2
aXJ0cXVldWVfYWRkX3NwbGl0KHN0cnVjdCB2aXJ0cXVldWUgKl92cSwKPiA+ID4gPiA+ID4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBpbl9zZ3Ms
Cj4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lk
ICpkYXRhLAo+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdm9pZCAqY3R4LAo+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgYm9vbCBwcmVtYXBwZWQsCj4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBnZnBfdCBnZnApCj4gPiA+ID4gPiA+ID4gIHsKPiA+ID4gPiA+
ID4gPiAgICAgICAgIHN0cnVjdCB2cmluZ192aXJ0cXVldWUgKnZxID0gdG9fdnZxKF92cSk7Cj4g
PiA+ID4gPiA+ID4gQEAgLTU5NSw3ICs2MDYsNyBAQCBzdGF0aWMgaW5saW5lIGludCB2aXJ0cXVl
dWVfYWRkX3NwbGl0KHN0cnVjdCB2aXJ0cXVldWUgKl92cSwKPiA+ID4gPiA+ID4gPiAgICAgICAg
ICAgICAgICAgZm9yIChzZyA9IHNnc1tuXTsgc2c7IHNnID0gc2dfbmV4dChzZykpIHsKPiA+ID4g
PiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICBkbWFfYWRkcl90IGFkZHI7Cj4gPiA+ID4g
PiA+ID4KPiA+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICBpZiAodnJpbmdfbWFw
X29uZV9zZyh2cSwgc2csIERNQV9UT19ERVZJQ0UsICZhZGRyKSkKPiA+ID4gPiA+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgICBpZiAodnJpbmdfbWFwX29uZV9zZyh2cSwgc2csIERNQV9UT19E
RVZJQ0UsIHByZW1hcHBlZCwgJmFkZHIpKQo+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZ290byB1bm1hcF9yZWxlYXNlOwo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4g
PiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgcHJldiA9IGk7Cj4gPiA+ID4gPiA+ID4gQEAg
LTYxMSw3ICs2MjIsNyBAQCBzdGF0aWMgaW5saW5lIGludCB2aXJ0cXVldWVfYWRkX3NwbGl0KHN0
cnVjdCB2aXJ0cXVldWUgKl92cSwKPiA+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgZm9yIChz
ZyA9IHNnc1tuXTsgc2c7IHNnID0gc2dfbmV4dChzZykpIHsKPiA+ID4gPiA+ID4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICBkbWFfYWRkcl90IGFkZHI7Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICBpZiAodnJpbmdfbWFwX29uZV9zZyh2cSwgc2cs
IERNQV9GUk9NX0RFVklDRSwgJmFkZHIpKQo+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgIGlmICh2cmluZ19tYXBfb25lX3NnKHZxLCBzZywgRE1BX0ZST01fREVWSUNFLCBwcmVt
YXBwZWQsICZhZGRyKSkKPiA+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGdvdG8gdW5tYXBfcmVsZWFzZTsKPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgIHByZXYgPSBpOwo+ID4gPiA+ID4gPiA+IEBAIC02NTcsNiArNjY4
LDcgQEAgc3RhdGljIGlubGluZSBpbnQgdmlydHF1ZXVlX2FkZF9zcGxpdChzdHJ1Y3QgdmlydHF1
ZXVlICpfdnEsCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiAgICAgICAgIC8qIFN0b3JlIHRv
a2VuIGFuZCBpbmRpcmVjdCBidWZmZXIgc3RhdGUuICovCj4gPiA+ID4gPiA+ID4gICAgICAgICB2
cS0+c3BsaXQuZGVzY19zdGF0ZVtoZWFkXS5kYXRhID0gZGF0YTsKPiA+ID4gPiA+ID4gPiArICAg
ICAgIHZxLT5zcGxpdC5kZXNjX3N0YXRlW2hlYWRdLnByZW1hcHBlZCA9IHByZW1hcHBlZDsKPiA+
ID4gPiA+ID4gPiAgICAgICAgIGlmIChpbmRpcmVjdCkKPiA+ID4gPiA+ID4gPiAgICAgICAgICAg
ICAgICAgdnEtPnNwbGl0LmRlc2Nfc3RhdGVbaGVhZF0uaW5kaXJfZGVzYyA9IGRlc2M7Cj4gPiA+
ID4gPiA+ID4gICAgICAgICBlbHNlCj4gPiA+ID4gPiA+ID4gQEAgLTY4Niw2ICs2OTgsMTQgQEAg
c3RhdGljIGlubGluZSBpbnQgdmlydHF1ZXVlX2FkZF9zcGxpdChzdHJ1Y3QgdmlydHF1ZXVlICpf
dnEsCj4gPiA+ID4gPiA+ID4gICAgICAgICByZXR1cm4gMDsKPiA+ID4gPiA+ID4gPgo+ID4gPiA+
ID4gPiA+ICB1bm1hcF9yZWxlYXNlOgo+ID4gPiA+ID4gPiA+ICsgICAgICAgaWYgKHByZW1hcHBl
ZCkgewo+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBpZiAoaW5kaXJlY3QpCj4gPiA+ID4g
PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAga2ZyZWUoZGVzYyk7Cj4gPiA+ID4gPiA+ID4g
Kwo+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBFTkRfVVNFKHZxKTsKPiA+ID4gPiA+ID4g
PiArICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gPiA+ID4gPiA+ID4gKyAgICAgICB9
Cj4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ICAgICAgICAgZXJyX2lkeCA9IGk7Cj4gPiA+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiAgICAgICAgIGlmIChpbmRpcmVjdCkKPiA+ID4gPiA+ID4g
PiBAQCAtNzAwLDcgKzcyMCw3IEBAIHN0YXRpYyBpbmxpbmUgaW50IHZpcnRxdWV1ZV9hZGRfc3Bs
aXQoc3RydWN0IHZpcnRxdWV1ZSAqX3ZxLAo+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgIHZyaW5nX3VubWFwX29uZV9zcGxpdF9pbmRpcmVjdCh2cSwgJmRlc2NbaV0pOwo+ID4g
PiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGkgPSB2aXJ0aW8xNl90b19jcHUoX3Zx
LT52ZGV2LCBkZXNjW2ldLm5leHQpOwo+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICB9IGVs
c2UKPiA+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICBpID0gdnJpbmdfdW5tYXBf
b25lX3NwbGl0KHZxLCBpKTsKPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBp
ID0gdnJpbmdfdW5tYXBfb25lX3NwbGl0KHZxLCBpLCBmYWxzZSk7Cj4gPiA+ID4gPiA+ID4gICAg
ICAgICB9Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiAgICAgICAgIGlmIChpbmRpcmVjdCkK
PiA+ID4gPiA+ID4gPiBAQCAtNzU3LDEyICs3NzcsMTIgQEAgc3RhdGljIHZvaWQgZGV0YWNoX2J1
Zl9zcGxpdChzdHJ1Y3QgdnJpbmdfdmlydHF1ZXVlICp2cSwgdW5zaWduZWQgaW50IGhlYWQsCj4g
PiA+ID4gPiA+ID4gICAgICAgICBpID0gaGVhZDsKPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+
ICAgICAgICAgd2hpbGUgKHZxLT5zcGxpdC52cmluZy5kZXNjW2ldLmZsYWdzICYgbmV4dGZsYWcp
IHsKPiA+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAgdnJpbmdfdW5tYXBfb25lX3NwbGl0KHZx
LCBpKTsKPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgdnJpbmdfdW5tYXBfb25lX3NwbGl0
KHZxLCBpLCBzdGF0ZS0+cHJlbWFwcGVkKTsKPiA+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAg
aSA9IHZxLT5zcGxpdC5kZXNjX2V4dHJhW2ldLm5leHQ7Cj4gPiA+ID4gPiA+ID4gICAgICAgICAg
ICAgICAgIHZxLT52cS5udW1fZnJlZSsrOwo+ID4gPiA+ID4gPiA+ICAgICAgICAgfQo+ID4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+ID4gLSAgICAgICB2cmluZ191bm1hcF9vbmVfc3BsaXQodnEsIGkp
Owo+ID4gPiA+ID4gPiA+ICsgICAgICAgdnJpbmdfdW5tYXBfb25lX3NwbGl0KHZxLCBpLCBzdGF0
ZS0+cHJlbWFwcGVkKTsKPiA+ID4gPiA+ID4gPiAgICAgICAgIHZxLT5zcGxpdC5kZXNjX2V4dHJh
W2ldLm5leHQgPSB2cS0+ZnJlZV9oZWFkOwo+ID4gPiA+ID4gPiA+ICAgICAgICAgdnEtPmZyZWVf
aGVhZCA9IGhlYWQ7Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBAQCAtNzgzLDcgKzgwMyw3
IEBAIHN0YXRpYyB2b2lkIGRldGFjaF9idWZfc3BsaXQoc3RydWN0IHZyaW5nX3ZpcnRxdWV1ZSAq
dnEsIHVuc2lnbmVkIGludCBoZWFkLAo+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgVlJJTkdfREVTQ19GX0lORElSRUNUKSk7Cj4gPiA+ID4gPiA+ID4gICAgICAg
ICAgICAgICAgIEJVR19PTihsZW4gPT0gMCB8fCBsZW4gJSBzaXplb2Yoc3RydWN0IHZyaW5nX2Rl
c2MpKTsKPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IC0gICAgICAgICAgICAgICBpZiAodnEt
PnVzZV9kbWFfYXBpKSB7Cj4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIGlmICh2cS0+dXNl
X2RtYV9hcGkgJiYgIXN0YXRlLT5wcmVtYXBwZWQpIHsKPiA+ID4gPiA+ID4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICBmb3IgKGogPSAwOyBqIDwgbGVuIC8gc2l6ZW9mKHN0cnVjdCB2cmluZ19k
ZXNjKTsgaisrKQo+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dnJpbmdfdW5tYXBfb25lX3NwbGl0X2luZGlyZWN0KHZxLCAmaW5kaXJfZGVzY1tqXSk7Cj4gPiA+
ID4gPiA+ID4gICAgICAgICAgICAgICAgIH0KPiA+ID4gPiA+ID4gPiBAQCAtMjE0Myw3ICsyMTYz
LDcgQEAgc3RhdGljIGlubGluZSBpbnQgdmlydHF1ZXVlX2FkZChzdHJ1Y3QgdmlydHF1ZXVlICpf
dnEsCj4gPiA+ID4gPiA+ID4gICAgICAgICByZXR1cm4gdnEtPnBhY2tlZF9yaW5nID8gdmlydHF1
ZXVlX2FkZF9wYWNrZWQoX3ZxLCBzZ3MsIHRvdGFsX3NnLAo+ID4gPiA+ID4gPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvdXRfc2dzLCBpbl9zZ3MsIGRhdGEsIGN0
eCwgZ2ZwKSA6Cj4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dmlydHF1ZXVlX2FkZF9zcGxpdChfdnEsIHNncywgdG90YWxfc2csCj4gPiA+ID4gPiA+ID4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG91dF9zZ3MsIGluX3NncywgZGF0
YSwgY3R4LCBnZnApOwo+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBvdXRfc2dzLCBpbl9zZ3MsIGRhdGEsIGN0eCwgcHJlbWFwcGVkLCBnZnApOwo+
ID4gPiA+ID4gPiA+ICB9Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiAgLyoqCj4gPiA+ID4g
PiA+ID4gLS0KPiA+ID4gPiA+ID4gPiAyLjMyLjAuMy5nMDExOTVjZjlmCj4gPiA+ID4gPiA+ID4K
PiA+ID4gPiA+Cj4gPiA+Cj4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxp
c3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
