Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E3A707AA5
	for <lists.virtualization@lfdr.de>; Thu, 18 May 2023 09:11:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EAFF94028D;
	Thu, 18 May 2023 07:11:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAFF94028D
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=K8KjmKYO
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nj97WqITPb8t; Thu, 18 May 2023 07:11:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 8F2DA40436;
	Thu, 18 May 2023 07:11:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F2DA40436
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D1F91C0089;
	Thu, 18 May 2023 07:11:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8221CC002A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 May 2023 07:11:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48D7460EA6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 May 2023 07:11:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48D7460EA6
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=K8KjmKYO
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JQhpH_iPc0tf
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 May 2023 07:11:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B664760E8A
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B664760E8A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 May 2023 07:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684393892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vg03gE4ULJN4I37AJX9ZQyw1xZmDHP90I7b4HE2rkzM=;
 b=K8KjmKYO9zu/5z2A6i21nevRrx6dZHK1qXJYpBvMG3y/Rm/o0ybNFaCEsjVdahdwtjE4mp
 90X6tuWD6RuEC0cL4c6A4elUuKlt1DXXIV9f4uSN6MAK8+tcI2u4m+HWKkSA/89KZn3tZj
 6qPO+11LaGVJXaIRbm/EJY8fsRPB+c0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-oPAEHkk8OCm8ENu0XYB9cA-1; Thu, 18 May 2023 03:11:31 -0400
X-MC-Unique: oPAEHkk8OCm8ENu0XYB9cA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f518f2900eso11415735e9.2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 May 2023 00:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684393890; x=1686985890;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vg03gE4ULJN4I37AJX9ZQyw1xZmDHP90I7b4HE2rkzM=;
 b=I/wPc+A5jEePGI4j0p0dFo+IG4TINZXJEh2cP0yrM5zJjHMmKADmhCHn8+8eSI18oV
 M25QpdTkYL39rc8v+p5QK6quNc3HMYz4xY0/bMsYk1t/DQzaHD0CkfgQ1zKpy0FvGLYD
 xAEgJsHSaHMkVUssGwuUjgY+lTjqAzKb1hYLH8EnxepP+OLxqdJ8UojXmuvPPKQ7geLA
 QEDPCuyf9aQCITDKB5C6GrMCHBlIreW4j3uBchGiFGhFNIf5gOEyRXM82zBGfeYqcLh4
 Abh8wy5T+sGzG0RvCo0CqzxxoumIQBfF93vunCJpmEjeWUaaB9PQinf8aLF7wPdfZUrp
 rk5Q==
X-Gm-Message-State: AC+VfDwOVG5KkhYbXao5CxX8zxbm1QvgIe1PYrNxAcVNBzGr+m4PL9gi
 dobx3j1yXVGx2YhXhupHYQ+noWHfLGeOH3RG5UnBZyPZjwZ6WgZRwuwXrld/ryL4TluKGKO2+8m
 MRo0hBZWeihhGSENR6oFRw/oRZenI7TwmOHiGqxwPdA==
X-Received: by 2002:a7b:cb46:0:b0:3f4:23df:c681 with SMTP id
 v6-20020a7bcb46000000b003f423dfc681mr631872wmj.12.1684393890057; 
 Thu, 18 May 2023 00:11:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7+KAqQ5oolbvn92nJrVrdeH8oIKTHBRW1+apEuiCMePvUpTLp1j7wOo7ApFaUkhVRRYqLEBA==
X-Received: by 2002:a7b:cb46:0:b0:3f4:23df:c681 with SMTP id
 v6-20020a7bcb46000000b003f423dfc681mr631854wmj.12.1684393889662; 
 Thu, 18 May 2023 00:11:29 -0700 (PDT)
Received: from redhat.com ([2.52.6.43]) by smtp.gmail.com with ESMTPSA id
 p4-20020a7bcc84000000b003f42d3111b8sm1037809wma.30.2023.05.18.00.11.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 May 2023 00:11:29 -0700 (PDT)
Date: Thu, 18 May 2023 03:11:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH vhost v9 05/12] virtio_ring: split: virtqueue_add_split()
 support premapped
Message-ID: <20230518030701-mutt-send-email-mst@kernel.org>
References: <20230517022249.20790-1-xuanzhuo@linux.alibaba.com>
 <20230517022249.20790-6-xuanzhuo@linux.alibaba.com>
 <CACGkMEu7+kDPiWmULXW_saW6pb5yF=gnqXRkSWcYbZCiJmszHQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEu7+kDPiWmULXW_saW6pb5yF=gnqXRkSWcYbZCiJmszHQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Christoph Hellwig <hch@infradead.org>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
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

T24gVGh1LCBNYXkgMTgsIDIwMjMgYXQgMDI6NTE6NTdQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiBPbiBXZWQsIE1heSAxNywgMjAyMyBhdCAxMDoyM+KAr0FNIFh1YW4gWmh1byA8eHVhbnpo
dW9AbGludXguYWxpYmFiYS5jb20+IHdyb3RlOgo+ID4KPiA+IHZpcnRxdWV1ZV9hZGRfc3BsaXQo
KSBvbmx5IHN1cHBvcnRzIHZpcnR1YWwgYWRkcmVzc2VzLCBkbWEgaXMgY29tcGxldGVkCj4gPiBp
biB2aXJ0cXVldWVfYWRkX3NwbGl0KCkuCj4gPgo+ID4gSW4gc29tZSBzY2VuYXJpb3MgKHN1Y2gg
YXMgdGhlIEFGX1hEUCBzY2VuYXJpbyksIHRoZSBtZW1vcnkgaXMgYWxsb2NhdGVkCj4gPiBhbmQg
RE1BIGlzIGNvbXBsZXRlZCBpbiBhZHZhbmNlLCBzbyBpdCBpcyBuZWNlc3NhcnkgZm9yIHVzIHRv
IHN1cHBvcnQKPiA+IHBhc3NpbmcgdGhlIERNQSBhZGRyZXNzIHRvIHZpcnRxdWV1ZV9hZGRfc3Bs
aXQoKS4KPiA+Cj4gPiBSZWNvcmQgdGhpcyBpbmZvcm1hdGlvbiBpbiBkZXNjX3N0YXRlLCB3ZSBj
YW4gc2tpcCB1bm1hcCBiYXNlZCBvbiB0aGlzCj4gPiB3aGVuIGV4ZWN1dGluZyBkbWEgdW5tYXAu
Cj4gCj4gSSB3b3VsZCBhbHNvIHN1Z2dlc3QgZG9jdW1lbnRpbmcgd2h5IGEgcGVyIGRlc2NyaXB0
b3IgbWV0YWRhdGEgaXMKPiBuZWVkZWQgaW5zdGVhZCBvZiBhIHBlciB2aXJ0cXVldWUgb25lLgoK
SSB0aGluayB3ZSBjb3VsZCBtYWtlIGl0IHBlciB2aXJ0cXVldWUuIFRoYXQgd291bGQgbWVhbiBh
bGwgY29kZSBpbgp2aXJ0aW8gbmV0IHdvdWxkIGhhdmUgdG8gY2hhbmdlIHRvIGRvIGRtYSBtYXBw
aW5nIGl0c2VsZiBpbnN0ZWFkIG9mCnJlbHlpbmcgb24gdmlydGlvIGNvcmUgdGhvdWdoLiAgV2hp
Y2ggaXMgbWF5YmUgYSBnb29kIGlkZWE/IERlZmluaXRlbHkgYQp2ZXJ5IGludHJ1c2l2ZSBjaGFu
Z2UgdGhvdWdoLCB3aWxsIG5lZWQgYSBsb3Qgb2YgcGVyZm9ybWFuY2UgdGVzdGluZwp0byBtYWtl
IHN1cmUgd2UgZG9uJ3QgYnJlYWsgYW55dGhpbmcuCgoKCgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IFh1YW4gWmh1byA8eHVhbnpodW9AbGludXguYWxpYmFiYS5jb20+Cj4gPiAtLS0KPiA+ICBkcml2
ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jIHwgMzggKysrKysrKysrKysrKysrKysrKysrKysrKysr
LS0tLS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDkgZGVsZXRp
b25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19yaW5nLmMg
Yi9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jCj4gPiBpbmRleCBlMmZjNTBjMDViZWMuLmJk
NWU4NGFmYWIzNyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19yaW5nLmMK
PiA+ICsrKyBiL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19yaW5nLmMKPiA+IEBAIC03MCw2ICs3MCw3
IEBACj4gPiAgc3RydWN0IHZyaW5nX2Rlc2Nfc3RhdGVfc3BsaXQgewo+ID4gICAgICAgICB2b2lk
ICpkYXRhOyAgICAgICAgICAgICAgICAgICAgIC8qIERhdGEgZm9yIGNhbGxiYWNrLiAqLwo+ID4g
ICAgICAgICBzdHJ1Y3QgdnJpbmdfZGVzYyAqaW5kaXJfZGVzYzsgIC8qIEluZGlyZWN0IGRlc2Ny
aXB0b3IsIGlmIGFueS4gKi8KPiA+ICsgICAgICAgYm9vbCBwcmVtYXBwZWQ7ICAgICAgICAgICAg
ICAgICAvKiBETUEgbWFwcGluZyBpcyBkb25lIGJ5IGRyaXZlci4gKi8KPiAKPiBHb2luZyBiYWNr
IHRvIHRoZSBvcmlnaW5hbCBkaXNjdXNzaW9uIGFyb3VuZCB3aGVyZSB0aGlzIHNob3VsZCBiZQo+
IHBsYWNlZC4gSSB3b25kZXIgaWYgd2UgY2FuIGZpbmQgYSBjb21tb24gcGxhY2UgdG8gc3RvcmUg
dGhpcyBzaW5jZSBpdAo+IGhhcyBub3RoaW5nIHJlbGF0ZWQgdG8gdmlydHF1ZXVlIGxheW91dC4g
TWF5YmUgZGVzY19leHRyYT8gQW5kIGl0Cj4gd291bGQgYmUgZXZlbiBiZXR0ZXIgaWYgd2UgY2Fu
IGF2b2lkIHN0cmVzc2luZyB0aGUgY2FjaGUgbGlrZSBhYm92ZS4KPiAKPiA+ICB9Owo+ID4KPiA+
ICBzdHJ1Y3QgdnJpbmdfZGVzY19zdGF0ZV9wYWNrZWQgewo+ID4gQEAgLTM1Niw4ICszNTcsMTQg
QEAgc3RhdGljIHN0cnVjdCBkZXZpY2UgKnZyaW5nX2RtYV9kZXYoY29uc3Qgc3RydWN0IHZyaW5n
X3ZpcnRxdWV1ZSAqdnEpCj4gPgo+ID4gIC8qIE1hcCBvbmUgc2cgZW50cnkuICovCj4gPiAgc3Rh
dGljIGludCB2cmluZ19tYXBfb25lX3NnKGNvbnN0IHN0cnVjdCB2cmluZ192aXJ0cXVldWUgKnZx
LCBzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnNnLAo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAg
IGVudW0gZG1hX2RhdGFfZGlyZWN0aW9uIGRpcmVjdGlvbiwgc3RhdGljIGRtYV9hZGRyX3QgKmFk
ZHIpCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgZW51bSBkbWFfZGF0YV9kaXJlY3Rp
b24gZGlyZWN0aW9uLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgcHJlbWFw
cGVkLCBkbWFfYWRkcl90ICphZGRyKQo+IAo+IGhhdmluZyB0aGluZ3MgbGlrZToKPiAKPiBpbnQg
ZnVuYyhib29sIGRvKQo+IHsKPiBpZiAoIWRvKQo+ICAgICByZXR1cm47Cj4gfQo+IAo+IGlzIGEg
aGludCB0aGF0IHRoZSBjaGVjayBuZWVkcyB0byBiZSBkb25lIGJ5IHRoZSBjYWxsZXI/Cj4gCj4g
QW5kIHRoaXMgY2hhbmdlIHNob3VsZCB3b3JrIGZvciBib3RoIHBhY2tlZCBhbmQgc3BsaXQuIEkg
dGhpbmsgd2UgbmVlZAo+IHRvIHNxdWFzaCB0aGUgcGFja2VkIGNoYW5nZXMgaGVyZS4KPiAKPiBM
b29raW5nIGF0IGhvdyBwYWNrZWQgdmlydHF1ZXVlIHVzZXMgdGhpcyBpbiB0aGlzIHBhdGNoLCBJ
IGRvbid0IHRoaW5rCj4gdGhpcyBwYXRjaCBjYW4gZXZlbiBiZSBidWlsdC4gSSB3aWxsIHdhaXQg
Zm9yIGEgbmV3IHZlcnNpb24gYW5kCj4gY29udGludWUgdGhlIHJldmlldyBmcm9tIHRoZXJlLgo+
IAo+IFRoYW5rcwo+IAo+IAo+IAo+ID4gIHsKPiA+ICsgICAgICAgaWYgKHByZW1hcHBlZCkgewo+
ID4gKyAgICAgICAgICAgICAgICphZGRyID0gc2dfZG1hX2FkZHJlc3Moc2cpOwo+ID4gKyAgICAg
ICAgICAgICAgIHJldHVybiAwOwo+ID4gKyAgICAgICB9Cj4gPiArCj4gPiAgICAgICAgIGlmICgh
dnEtPnVzZV9kbWFfYXBpKSB7Cj4gPiAgICAgICAgICAgICAgICAgLyoKPiA+ICAgICAgICAgICAg
ICAgICAgKiBJZiBETUEgaXMgbm90IHVzZWQsIEtNU0FOIGRvZXNuJ3Qga25vdyB0aGF0IHRoZSBz
Y2F0dGVybGlzdAo+ID4gQEAgLTQ0NSw3ICs0NTIsNyBAQCBzdGF0aWMgdm9pZCB2cmluZ191bm1h
cF9vbmVfc3BsaXRfaW5kaXJlY3QoY29uc3Qgc3RydWN0IHZyaW5nX3ZpcnRxdWV1ZSAqdnEsCj4g
PiAgfQo+ID4KPiA+ICBzdGF0aWMgdW5zaWduZWQgaW50IHZyaW5nX3VubWFwX29uZV9zcGxpdChj
b25zdCBzdHJ1Y3QgdnJpbmdfdmlydHF1ZXVlICp2cSwKPiA+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBpKQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGksIGJvb2wgcHJlbWFwcGVk
KQo+ID4gIHsKPiA+ICAgICAgICAgc3RydWN0IHZyaW5nX2Rlc2NfZXh0cmEgKmV4dHJhID0gdnEt
PnNwbGl0LmRlc2NfZXh0cmE7Cj4gPiAgICAgICAgIHUxNiBmbGFnczsKPiA+IEBAIC00NjIsNiAr
NDY5LDkgQEAgc3RhdGljIHVuc2lnbmVkIGludCB2cmluZ191bm1hcF9vbmVfc3BsaXQoY29uc3Qg
c3RydWN0IHZyaW5nX3ZpcnRxdWV1ZSAqdnEsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAoZmxhZ3MgJiBWUklOR19ERVNDX0ZfV1JJVEUpID8KPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIERNQV9GUk9NX0RFVklDRSA6IERNQV9UT19ERVZJQ0UpOwo+ID4g
ICAgICAgICB9IGVsc2Ugewo+ID4gKyAgICAgICAgICAgICAgIGlmIChwcmVtYXBwZWQpCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsKPiA+ICsKPiA+ICAgICAgICAgICAgICAg
ICBkbWFfdW5tYXBfcGFnZSh2cmluZ19kbWFfZGV2KHZxKSwKPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBleHRyYVtpXS5hZGRyLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGV4dHJhW2ldLmxlbiwKPiA+IEBAIC01MzIsNiArNTQyLDcgQEAgc3RhdGljIGlubGlu
ZSBpbnQgdmlydHF1ZXVlX2FkZF9zcGxpdChzdHJ1Y3QgdmlydHF1ZXVlICpfdnEsCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBpbl9zZ3MsCj4g
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKmRhdGEsCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKmN0eCwKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCBwcmVtYXBwZWQsCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdmcF90IGdmcCkKPiA+ICB7Cj4gPiAg
ICAgICAgIHN0cnVjdCB2cmluZ192aXJ0cXVldWUgKnZxID0gdG9fdnZxKF92cSk7Cj4gPiBAQCAt
NTk1LDcgKzYwNiw3IEBAIHN0YXRpYyBpbmxpbmUgaW50IHZpcnRxdWV1ZV9hZGRfc3BsaXQoc3Ry
dWN0IHZpcnRxdWV1ZSAqX3ZxLAo+ID4gICAgICAgICAgICAgICAgIGZvciAoc2cgPSBzZ3Nbbl07
IHNnOyBzZyA9IHNnX25leHQoc2cpKSB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBkbWFf
YWRkcl90IGFkZHI7Cj4gPgo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgaWYgKHZyaW5nX21h
cF9vbmVfc2codnEsIHNnLCBETUFfVE9fREVWSUNFLCAmYWRkcikpCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICBpZiAodnJpbmdfbWFwX29uZV9zZyh2cSwgc2csIERNQV9UT19ERVZJQ0UsIHBy
ZW1hcHBlZCwgJmFkZHIpKQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnb3Rv
IHVubWFwX3JlbGVhc2U7Cj4gPgo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgcHJldiA9IGk7
Cj4gPiBAQCAtNjExLDcgKzYyMiw3IEBAIHN0YXRpYyBpbmxpbmUgaW50IHZpcnRxdWV1ZV9hZGRf
c3BsaXQoc3RydWN0IHZpcnRxdWV1ZSAqX3ZxLAo+ID4gICAgICAgICAgICAgICAgIGZvciAoc2cg
PSBzZ3Nbbl07IHNnOyBzZyA9IHNnX25leHQoc2cpKSB7Cj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICBkbWFfYWRkcl90IGFkZHI7Cj4gPgo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgaWYg
KHZyaW5nX21hcF9vbmVfc2codnEsIHNnLCBETUFfRlJPTV9ERVZJQ0UsICZhZGRyKSkKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGlmICh2cmluZ19tYXBfb25lX3NnKHZxLCBzZywgRE1BX0ZS
T01fREVWSUNFLCBwcmVtYXBwZWQsICZhZGRyKSkKPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZ290byB1bm1hcF9yZWxlYXNlOwo+ID4KPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgIHByZXYgPSBpOwo+ID4gQEAgLTY1Nyw2ICs2NjgsNyBAQCBzdGF0aWMgaW5saW5lIGludCB2
aXJ0cXVldWVfYWRkX3NwbGl0KHN0cnVjdCB2aXJ0cXVldWUgKl92cSwKPiA+Cj4gPiAgICAgICAg
IC8qIFN0b3JlIHRva2VuIGFuZCBpbmRpcmVjdCBidWZmZXIgc3RhdGUuICovCj4gPiAgICAgICAg
IHZxLT5zcGxpdC5kZXNjX3N0YXRlW2hlYWRdLmRhdGEgPSBkYXRhOwo+ID4gKyAgICAgICB2cS0+
c3BsaXQuZGVzY19zdGF0ZVtoZWFkXS5wcmVtYXBwZWQgPSBwcmVtYXBwZWQ7Cj4gPiAgICAgICAg
IGlmIChpbmRpcmVjdCkKPiA+ICAgICAgICAgICAgICAgICB2cS0+c3BsaXQuZGVzY19zdGF0ZVto
ZWFkXS5pbmRpcl9kZXNjID0gZGVzYzsKPiA+ICAgICAgICAgZWxzZQo+ID4gQEAgLTY4Niw2ICs2
OTgsMTQgQEAgc3RhdGljIGlubGluZSBpbnQgdmlydHF1ZXVlX2FkZF9zcGxpdChzdHJ1Y3Qgdmly
dHF1ZXVlICpfdnEsCj4gPiAgICAgICAgIHJldHVybiAwOwo+ID4KPiA+ICB1bm1hcF9yZWxlYXNl
Ogo+ID4gKyAgICAgICBpZiAocHJlbWFwcGVkKSB7Cj4gPiArICAgICAgICAgICAgICAgaWYgKGlu
ZGlyZWN0KQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAga2ZyZWUoZGVzYyk7Cj4gPiArCj4g
PiArICAgICAgICAgICAgICAgRU5EX1VTRSh2cSk7Cj4gPiArICAgICAgICAgICAgICAgcmV0dXJu
IC1FTk9NRU07Cj4gPiArICAgICAgIH0KPiA+ICsKPiA+ICAgICAgICAgZXJyX2lkeCA9IGk7Cj4g
Pgo+ID4gICAgICAgICBpZiAoaW5kaXJlY3QpCj4gPiBAQCAtNzAwLDcgKzcyMCw3IEBAIHN0YXRp
YyBpbmxpbmUgaW50IHZpcnRxdWV1ZV9hZGRfc3BsaXQoc3RydWN0IHZpcnRxdWV1ZSAqX3ZxLAo+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgdnJpbmdfdW5tYXBfb25lX3NwbGl0X2luZGlyZWN0
KHZxLCAmZGVzY1tpXSk7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBpID0gdmlydGlvMTZf
dG9fY3B1KF92cS0+dmRldiwgZGVzY1tpXS5uZXh0KTsKPiA+ICAgICAgICAgICAgICAgICB9IGVs
c2UKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIGkgPSB2cmluZ191bm1hcF9vbmVfc3BsaXQo
dnEsIGkpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaSA9IHZyaW5nX3VubWFwX29uZV9z
cGxpdCh2cSwgaSwgZmFsc2UpOwo+ID4gICAgICAgICB9Cj4gPgo+ID4gICAgICAgICBpZiAoaW5k
aXJlY3QpCj4gPiBAQCAtNzU3LDEyICs3NzcsMTIgQEAgc3RhdGljIHZvaWQgZGV0YWNoX2J1Zl9z
cGxpdChzdHJ1Y3QgdnJpbmdfdmlydHF1ZXVlICp2cSwgdW5zaWduZWQgaW50IGhlYWQsCj4gPiAg
ICAgICAgIGkgPSBoZWFkOwo+ID4KPiA+ICAgICAgICAgd2hpbGUgKHZxLT5zcGxpdC52cmluZy5k
ZXNjW2ldLmZsYWdzICYgbmV4dGZsYWcpIHsKPiA+IC0gICAgICAgICAgICAgICB2cmluZ191bm1h
cF9vbmVfc3BsaXQodnEsIGkpOwo+ID4gKyAgICAgICAgICAgICAgIHZyaW5nX3VubWFwX29uZV9z
cGxpdCh2cSwgaSwgc3RhdGUtPnByZW1hcHBlZCk7Cj4gPiAgICAgICAgICAgICAgICAgaSA9IHZx
LT5zcGxpdC5kZXNjX2V4dHJhW2ldLm5leHQ7Cj4gPiAgICAgICAgICAgICAgICAgdnEtPnZxLm51
bV9mcmVlKys7Cj4gPiAgICAgICAgIH0KPiA+Cj4gPiAtICAgICAgIHZyaW5nX3VubWFwX29uZV9z
cGxpdCh2cSwgaSk7Cj4gPiArICAgICAgIHZyaW5nX3VubWFwX29uZV9zcGxpdCh2cSwgaSwgc3Rh
dGUtPnByZW1hcHBlZCk7Cj4gPiAgICAgICAgIHZxLT5zcGxpdC5kZXNjX2V4dHJhW2ldLm5leHQg
PSB2cS0+ZnJlZV9oZWFkOwo+ID4gICAgICAgICB2cS0+ZnJlZV9oZWFkID0gaGVhZDsKPiA+Cj4g
PiBAQCAtNzgzLDcgKzgwMyw3IEBAIHN0YXRpYyB2b2lkIGRldGFjaF9idWZfc3BsaXQoc3RydWN0
IHZyaW5nX3ZpcnRxdWV1ZSAqdnEsIHVuc2lnbmVkIGludCBoZWFkLAo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBWUklOR19ERVNDX0ZfSU5ESVJFQ1QpKTsKPiA+ICAgICAgICAg
ICAgICAgICBCVUdfT04obGVuID09IDAgfHwgbGVuICUgc2l6ZW9mKHN0cnVjdCB2cmluZ19kZXNj
KSk7Cj4gPgo+ID4gLSAgICAgICAgICAgICAgIGlmICh2cS0+dXNlX2RtYV9hcGkpIHsKPiA+ICsg
ICAgICAgICAgICAgICBpZiAodnEtPnVzZV9kbWFfYXBpICYmICFzdGF0ZS0+cHJlbWFwcGVkKSB7
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBmb3IgKGogPSAwOyBqIDwgbGVuIC8gc2l6ZW9m
KHN0cnVjdCB2cmluZ19kZXNjKTsgaisrKQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB2cmluZ191bm1hcF9vbmVfc3BsaXRfaW5kaXJlY3QodnEsICZpbmRpcl9kZXNjW2pdKTsK
PiA+ICAgICAgICAgICAgICAgICB9Cj4gPiBAQCAtMjE0Myw3ICsyMTYzLDcgQEAgc3RhdGljIGlu
bGluZSBpbnQgdmlydHF1ZXVlX2FkZChzdHJ1Y3QgdmlydHF1ZXVlICpfdnEsCj4gPiAgICAgICAg
IHJldHVybiB2cS0+cGFja2VkX3JpbmcgPyB2aXJ0cXVldWVfYWRkX3BhY2tlZChfdnEsIHNncywg
dG90YWxfc2csCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgb3V0
X3NncywgaW5fc2dzLCBkYXRhLCBjdHgsIGdmcCkgOgo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdmlydHF1ZXVlX2FkZF9zcGxpdChfdnEsIHNncywgdG90YWxfc2csCj4gPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgb3V0X3NncywgaW5fc2dzLCBk
YXRhLCBjdHgsIGdmcCk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgb3V0X3NncywgaW5fc2dzLCBkYXRhLCBjdHgsIHByZW1hcHBlZCwgZ2ZwKTsKPiA+ICB9Cj4g
Pgo+ID4gIC8qKgo+ID4gLS0KPiA+IDIuMzIuMC4zLmcwMTE5NWNmOWYKPiA+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWls
aW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6
Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRp
b24=
