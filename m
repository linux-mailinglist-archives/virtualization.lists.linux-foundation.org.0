Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C21B74E450
	for <lists.virtualization@lfdr.de>; Tue, 11 Jul 2023 04:36:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AC7C81D5C;
	Tue, 11 Jul 2023 02:36:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AC7C81D5C
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SVKgZqJl
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e8bj4yPmA6ZS; Tue, 11 Jul 2023 02:36:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1E9B481D02;
	Tue, 11 Jul 2023 02:36:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E9B481D02
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4439CC008D;
	Tue, 11 Jul 2023 02:36:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CD731C0032
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Jul 2023 02:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7BA14018B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Jul 2023 02:36:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7BA14018B
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=SVKgZqJl
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8y7LGtA1JHoY
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Jul 2023 02:36:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07A50400D3
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 07A50400D3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Jul 2023 02:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689042991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z0jeq9FZM2tNLtGRKT3LhnHcrNSQmAW9/WwKmU+IPfw=;
 b=SVKgZqJlFrfYpC1I/LGhbNBz+Uo2ACmbUkUPjLvd7SEXda06YV1FoavW+ExlKRIuPOvSr5
 PLz+wBf9M8GeAUp7TUxmVj6LbZwZXIWMsqtP0aJYvmjhHTCi3xthIg5G7p6LsqmhcmkKPJ
 A6sZm12nn0+jPSAYXdWCIB8mzWDS73c=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-p4oeBqmXO3CUI7tYS2eQjw-1; Mon, 10 Jul 2023 22:36:30 -0400
X-MC-Unique: p4oeBqmXO3CUI7tYS2eQjw-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2b6e73c6da6so49463581fa.0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Jul 2023 19:36:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689042989; x=1691634989;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z0jeq9FZM2tNLtGRKT3LhnHcrNSQmAW9/WwKmU+IPfw=;
 b=NhWSP2Ykz4Pb6rek40iMcbaFTTxv3TEWzraBGnuhUlYl1TctxC4a5r8z+BFXnqWpg9
 weiR1GZz4G/cHQqME76pLWQ1UNCFD5dl4Zfz6ZrZHUwLqyQYioATnTd/X2KHp0DyrYBq
 P5SNvvAR0T8EVAWgrTRPNPQ1AuDN2S473Wb7Sajv0DSWUCAUzWjf30qbhhReDuptjBLO
 mSIOCeZgpvJocz66YR04ZE3WSWoMzhFuGEREW5BOczAQdnbuu78Kgj2//Qi6i8zvrHZt
 abic9ct4N09LAAFtOR16aq4u75aveJVXnyCvfvcSE35LtPt8IR7KoEqpb6vEWiNkS6d4
 s8lA==
X-Gm-Message-State: ABy/qLb3Bq02J6bjZVzKHnNgd9DcNq6TJVru+Ns53Uvs1dUt4U3bgQuh
 PxyidnbqGZwO8Hy52rd8YIPJ+nTSx9o7TMeNZNfkRPS0Ikyard9RRi96zhyYxIFqunK88gvRSJs
 PD4ckmDdPVXgBPBov+m+GlpL3X+sNGj4tWF8DcctpakZMCGSYm+/NZUZZJw==
X-Received: by 2002:a2e:94c3:0:b0:2b6:dc84:b93e with SMTP id
 r3-20020a2e94c3000000b002b6dc84b93emr11503822ljh.21.1689042989000; 
 Mon, 10 Jul 2023 19:36:29 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF/avPpNiz4Yeqf3hwdwqyHygIktXzHZtZIacj1CqfaZ7tESJ0fcoiZlM4/fMqaRROiYCEBssj1dAUTcWziT5E=
X-Received: by 2002:a2e:94c3:0:b0:2b6:dc84:b93e with SMTP id
 r3-20020a2e94c3000000b002b6dc84b93emr11503809ljh.21.1689042988732; Mon, 10
 Jul 2023 19:36:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230710034237.12391-1-xuanzhuo@linux.alibaba.com>
 <20230710034237.12391-11-xuanzhuo@linux.alibaba.com>
 <20230710051818-mutt-send-email-mst@kernel.org>
 <1688984310.480753-2-xuanzhuo@linux.alibaba.com>
 <20230710075534-mutt-send-email-mst@kernel.org>
 <1688992712.1534917-3-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1688992712.1534917-3-xuanzhuo@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 11 Jul 2023 10:36:17 +0800
Message-ID: <CACGkMEsp0S2APzXENcK-SY8KZwu-1=w3xXNxh5kXT36EsiwaNQ@mail.gmail.com>
Subject: Re: [PATCH vhost v11 10/10] virtio_net: merge dma operation for one
 page
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, virtualization@lists.linux-foundation.org,
 Christoph Hellwig <hch@infradead.org>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>
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

T24gTW9uLCBKdWwgMTAsIDIwMjMgYXQgODo0MeKAr1BNIFh1YW4gWmh1byA8eHVhbnpodW9AbGlu
dXguYWxpYmFiYS5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCAxMCBKdWwgMjAyMyAwNzo1OTowMyAt
MDQwMCwgIk1pY2hhZWwgUy4gVHNpcmtpbiIgPG1zdEByZWRoYXQuY29tPiB3cm90ZToKPiA+IE9u
IE1vbiwgSnVsIDEwLCAyMDIzIGF0IDA2OjE4OjMwUE0gKzA4MDAsIFh1YW4gWmh1byB3cm90ZToK
PiA+ID4gT24gTW9uLCAxMCBKdWwgMjAyMyAwNTo0MDoyMSAtMDQwMCwgIk1pY2hhZWwgUy4gVHNp
cmtpbiIgPG1zdEByZWRoYXQuY29tPiB3cm90ZToKPiA+ID4gPiBPbiBNb24sIEp1bCAxMCwgMjAy
MyBhdCAxMTo0MjozN0FNICswODAwLCBYdWFuIFpodW8gd3JvdGU6Cj4gPiA+ID4gPiBDdXJyZW50
bHksIHRoZSB2aXJ0aW8gY29yZSB3aWxsIHBlcmZvcm0gYSBkbWEgb3BlcmF0aW9uIGZvciBlYWNo
Cj4gPiA+ID4gPiBvcGVyYXRpb24uIEFsdGhvdWdoLCB0aGUgc2FtZSBwYWdlIG1heSBiZSBvcGVy
YXRlZCBtdWx0aXBsZSB0aW1lcy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGUgZHJpdmVyIGRvZXMg
dGhlIGRtYSBvcGVyYXRpb24gYW5kIG1hbmFnZXMgdGhlIGRtYSBhZGRyZXNzIGJhc2VkIHRoZQo+
ID4gPiA+ID4gZmVhdHVyZSBwcmVtYXBwZWQgb2YgdmlydGlvIGNvcmUuCj4gPiA+ID4gPgo+ID4g
PiA+ID4gVGhpcyB3YXksIHdlIGNhbiBwZXJmb3JtIG9ubHkgb25lIGRtYSBvcGVyYXRpb24gZm9y
IHRoZSBzYW1lIHBhZ2UuIEluCj4gPiA+ID4gPiB0aGUgY2FzZSBvZiBtdHUgMTUwMCwgdGhpcyBj
YW4gcmVkdWNlIGEgbG90IG9mIGRtYSBvcGVyYXRpb25zLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFRl
c3RlZCBvbiBBbGl5dW4gZzcuNGxhcmdlIG1hY2hpbmUsIGluIHRoZSBjYXNlIG9mIGEgY3B1IDEw
MCUsIHBwcwo+ID4gPiA+ID4gaW5jcmVhc2VkIGZyb20gMTg5Mzc2NiB0byAxOTAxMTA1LiBBbiBp
bmNyZWFzZSBvZiAwLjQlLgo+ID4gPiA+Cj4gPiA+ID4gd2hhdCBraW5kIG9mIGRtYSB3YXMgdGhl
cmU/IGFuIElPTU1VPyB3aGljaCB2ZW5kb3JzPyBpbiB3aGljaCBtb2RlCj4gPiA+ID4gb2Ygb3Bl
cmF0aW9uPwo+ID4gPgo+ID4gPgo+ID4gPiBEbyB5b3UgbWVhbiB0aGlzOgo+ID4gPgo+ID4gPiBb
ICAgIDAuNDcwODE2XSBpb21tdTogRGVmYXVsdCBkb21haW4gdHlwZTogUGFzc3Rocm91Z2gKPiA+
ID4KPiA+Cj4gPiBXaXRoIHBhc3N0aHJvdWdoLCBkbWEgQVBJIGlzIGp1c3Qgc29tZSBpbmRpcmVj
dCBmdW5jdGlvbiBjYWxscywgdGhleSBkbwo+ID4gbm90IGFmZmVjdCB0aGUgcGVyZm9ybWFuY2Ug
YSBsb3QuCj4KPgo+IFllcywgdGhpcyBiZW5lZml0IGlzIHdvcnRobGVzcy4gSSBzZWVtIHRvIGhh
dmUgZG9uZSBhIG1lYW5pbmdsZXNzIHRoaW5nLiBUaGUKPiBvdmVyaGVhZCBvZiBETUEgSSBvYnNl
cnZlZCBpcyBpbmRlZWQgbm90IHRvbyBoaWdoLgoKSGF2ZSB5b3UgbWVhc3VyZWQgd2l0aCBpb21t
dT1zdHJpY3Q/CgpUaGFua3MKCj4KPiBUaGFua3MuCj4KPgo+ID4KPiA+IFRyeSBlLmcuIGJvdW5j
ZSBidWZmZXIuIFdoaWNoIGlzIHdoZXJlIHlvdSB3aWxsIHNlZSBhIHByb2JsZW06IHlvdXIKPiA+
IHBhdGNoZXMgd29uJ3Qgd29yay4KPiA+Cj4gPgo+ID4gPiA+Cj4gPiA+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBYdWFuIFpodW8gPHh1YW56aHVvQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4gPiA+Cj4gPiA+
ID4gVGhpcyBraW5kIG9mIGRpZmZlcmVuY2UgaXMgbGlrZWx5IGluIHRoZSBub2lzZS4KPiA+ID4K
PiA+ID4gSXQncyByZWFsbHkgbm90IGhpZ2gsIGJ1dCB0aGlzIGlzIGJlY2F1c2UgdGhlIHByb3Bv
cnRpb24gb2YgRE1BIHVuZGVyIHBlcmYgdG9wCj4gPiA+IGlzIG5vdCBoaWdoLiBQcm9iYWJseSB0
aGF0IG11Y2guCj4gPgo+ID4gU28gbWF5YmUgbm90IHdvcnRoIHRoZSBjb21wbGV4aXR5Lgo+ID4K
PiA+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ICBkcml2ZXJzL25ldC92aXJ0
aW9fbmV0LmMgfCAyODMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tCj4g
PiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDI2NyBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMo
LSkKPiA+ID4gPiA+Cj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvdmlydGlvX25l
dC5jIGIvZHJpdmVycy9uZXQvdmlydGlvX25ldC5jCj4gPiA+ID4gPiBpbmRleCA0ODZiNTg0OTAz
M2QuLjRkZTg0NWQzNWJlZCAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvbmV0L3ZpcnRp
b19uZXQuYwo+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9uZXQvdmlydGlvX25ldC5jCj4gPiA+ID4g
PiBAQCAtMTI2LDYgKzEyNiwyNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHZpcnRuZXRfc3RhdF9k
ZXNjIHZpcnRuZXRfcnFfc3RhdHNfZGVzY1tdID0gewo+ID4gPiA+ID4gICNkZWZpbmUgVklSVE5F
VF9TUV9TVEFUU19MRU4gICBBUlJBWV9TSVpFKHZpcnRuZXRfc3Ffc3RhdHNfZGVzYykKPiA+ID4g
PiA+ICAjZGVmaW5lIFZJUlRORVRfUlFfU1RBVFNfTEVOICAgQVJSQVlfU0laRSh2aXJ0bmV0X3Jx
X3N0YXRzX2Rlc2MpCj4gPiA+ID4gPgo+ID4gPiA+ID4gKy8qIFRoZSBidWZzIG9uIHRoZSBzYW1l
IHBhZ2UgbWF5IHNoYXJlIHRoaXMgc3RydWN0LiAqLwo+ID4gPiA+ID4gK3N0cnVjdCB2aXJ0bmV0
X3JxX2RtYSB7Cj4gPiA+ID4gPiArICAgICAgIHN0cnVjdCB2aXJ0bmV0X3JxX2RtYSAqbmV4dDsK
PiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsgICAgICAgZG1hX2FkZHJfdCBhZGRyOwo+ID4gPiA+ID4g
Kwo+ID4gPiA+ID4gKyAgICAgICB2b2lkICpidWY7Cj4gPiA+ID4gPiArICAgICAgIHUzMiBsZW47
Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArICAgICAgIHUzMiByZWY7Cj4gPiA+ID4gPiArfTsKPiA+
ID4gPiA+ICsKPiA+ID4gPiA+ICsvKiBSZWNvcmQgdGhlIGRtYSBhbmQgYnVmLiAqLwo+ID4gPiA+
Cj4gPiA+ID4gSSBndWVzcyBJIHNlZSB0aGF0LiBCdXQgd2h5Pwo+ID4gPiA+IEFuZCB0aGVzZSB0
d28gY29tbWVudHMgYXJlIHRoZSBleHRlbnQgb2YgdGhlIGF2YWlsYWJsZQo+ID4gPiA+IGRvY3Vt
ZW50YXRpb24sIHRoYXQncyBub3QgZW5vdWdoIEkgZmVlbC4KPiA+ID4gPgo+ID4gPiA+Cj4gPiA+
ID4gPiArc3RydWN0IHZpcnRuZXRfcnFfZGF0YSB7Cj4gPiA+ID4gPiArICAgICAgIHN0cnVjdCB2
aXJ0bmV0X3JxX2RhdGEgKm5leHQ7Cj4gPiA+ID4KPiA+ID4gPiBJcyBtYW51YWxseSByZWltcGxl
bWVudGluZyBhIGxpbmtlZCBsaXN0IHRoZSBiZXN0Cj4gPiA+ID4gd2UgY2FuIGRvPwo+ID4gPgo+
ID4gPiBZZXMsIHdlIGNhbiB1c2UgbGxpc3QuCj4gPiA+Cj4gPiA+ID4KPiA+ID4gPiA+ICsKPiA+
ID4gPiA+ICsgICAgICAgdm9pZCAqYnVmOwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgICAgICBz
dHJ1Y3QgdmlydG5ldF9ycV9kbWEgKmRtYTsKPiA+ID4gPiA+ICt9Owo+ID4gPiA+ID4gKwo+ID4g
PiA+ID4gIC8qIEludGVybmFsIHJlcHJlc2VudGF0aW9uIG9mIGEgc2VuZCB2aXJ0cXVldWUgKi8K
PiA+ID4gPiA+ICBzdHJ1Y3Qgc2VuZF9xdWV1ZSB7Cj4gPiA+ID4gPiAgICAgICAgIC8qIFZpcnRx
dWV1ZSBhc3NvY2lhdGVkIHdpdGggdGhpcyBzZW5kIF9xdWV1ZSAqLwo+ID4gPiA+ID4gQEAgLTE3
NSw2ICsxOTYsMTMgQEAgc3RydWN0IHJlY2VpdmVfcXVldWUgewo+ID4gPiA+ID4gICAgICAgICBj
aGFyIG5hbWVbMTZdOwo+ID4gPiA+ID4KPiA+ID4gPiA+ICAgICAgICAgc3RydWN0IHhkcF9yeHFf
aW5mbyB4ZHBfcnhxOwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgICAgICBzdHJ1Y3QgdmlydG5l
dF9ycV9kYXRhICpkYXRhX2FycmF5Owo+ID4gPiA+ID4gKyAgICAgICBzdHJ1Y3QgdmlydG5ldF9y
cV9kYXRhICpkYXRhX2ZyZWU7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArICAgICAgIHN0cnVjdCB2
aXJ0bmV0X3JxX2RtYSAqZG1hX2FycmF5Owo+ID4gPiA+ID4gKyAgICAgICBzdHJ1Y3QgdmlydG5l
dF9ycV9kbWEgKmRtYV9mcmVlOwo+ID4gPiA+ID4gKyAgICAgICBzdHJ1Y3QgdmlydG5ldF9ycV9k
bWEgKmxhc3RfZG1hOwo+ID4gPiA+ID4gIH07Cj4gPiA+ID4gPgo+ID4gPiA+ID4gIC8qIFRoaXMg
c3RydWN0dXJlIGNhbiBjb250YWluIHJzcyBtZXNzYWdlIHdpdGggbWF4aW11bSBzZXR0aW5ncyBm
b3IgaW5kaXJlY3Rpb24gdGFibGUgYW5kIGtleXNpemUKPiA+ID4gPiA+IEBAIC01NDksNiArNTc3
LDE3NiBAQCBzdGF0aWMgc3RydWN0IHNrX2J1ZmYgKnBhZ2VfdG9fc2tiKHN0cnVjdCB2aXJ0bmV0
X2luZm8gKnZpLAo+ID4gPiA+ID4gICAgICAgICByZXR1cm4gc2tiOwo+ID4gPiA+ID4gIH0KPiA+
ID4gPiA+Cj4gPiA+ID4gPiArc3RhdGljIHZvaWQgdmlydG5ldF9ycV91bm1hcChzdHJ1Y3QgcmVj
ZWl2ZV9xdWV1ZSAqcnEsIHN0cnVjdCB2aXJ0bmV0X3JxX2RtYSAqZG1hKQo+ID4gPiA+ID4gK3sK
PiA+ID4gPiA+ICsgICAgICAgc3RydWN0IGRldmljZSAqZGV2Owo+ID4gPiA+ID4gKwo+ID4gPiA+
ID4gKyAgICAgICAtLWRtYS0+cmVmOwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgICAgICBpZiAo
ZG1hLT5yZWYpCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgcmV0dXJuOwo+ID4gPiA+ID4gKwo+
ID4gPiA+Cj4gPiA+ID4gSWYgeW91IGRvbid0IHVubWFwIHRoZXJlIGlzIG5vIGd1YXJhbnRlZSB2
YWxpZCBkYXRhIHdpbGwgYmUKPiA+ID4gPiB0aGVyZSBpbiB0aGUgYnVmZmVyLgo+ID4gPiA+Cj4g
PiA+ID4gPiArICAgICAgIGRldiA9IHZpcnRxdWV1ZV9kbWFfZGV2KHJxLT52cSk7Cj4gPiA+ID4g
PiArCj4gPiA+ID4gPiArICAgICAgIGRtYV91bm1hcF9wYWdlKGRldiwgZG1hLT5hZGRyLCBkbWEt
PmxlbiwgRE1BX0ZST01fREVWSUNFKTsKPiA+ID4gPgo+ID4gPiA+Cj4gPiA+ID4KPiA+ID4gPgo+
ID4gPiA+Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArICAgICAgIGRtYS0+bmV4dCA9IHJxLT5kbWFf
ZnJlZTsKPiA+ID4gPiA+ICsgICAgICAgcnEtPmRtYV9mcmVlID0gZG1hOwo+ID4gPiA+ID4gK30K
PiA+ID4gPiA+ICsKPiA+ID4gPiA+ICtzdGF0aWMgdm9pZCAqdmlydG5ldF9ycV9yZWN5Y2xlX2Rh
dGEoc3RydWN0IHJlY2VpdmVfcXVldWUgKnJxLAo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHN0cnVjdCB2aXJ0bmV0X3JxX2RhdGEgKmRhdGEpCj4gPiA+ID4g
PiArewo+ID4gPiA+ID4gKyAgICAgICB2b2lkICpidWY7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiAr
ICAgICAgIGJ1ZiA9IGRhdGEtPmJ1ZjsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsgICAgICAgZGF0
YS0+bmV4dCA9IHJxLT5kYXRhX2ZyZWU7Cj4gPiA+ID4gPiArICAgICAgIHJxLT5kYXRhX2ZyZWUg
PSBkYXRhOwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgICAgICByZXR1cm4gYnVmOwo+ID4gPiA+
ID4gK30KPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICtzdGF0aWMgc3RydWN0IHZpcnRuZXRfcnFfZGF0
YSAqdmlydG5ldF9ycV9nZXRfZGF0YShzdHJ1Y3QgcmVjZWl2ZV9xdWV1ZSAqcnEsCj4gPiA+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lk
ICpidWYsCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzdHJ1Y3QgdmlydG5ldF9ycV9kbWEgKmRtYSkKPiA+ID4gPiA+ICt7Cj4gPiA+
ID4gPiArICAgICAgIHN0cnVjdCB2aXJ0bmV0X3JxX2RhdGEgKmRhdGE7Cj4gPiA+ID4gPiArCj4g
PiA+ID4gPiArICAgICAgIGRhdGEgPSBycS0+ZGF0YV9mcmVlOwo+ID4gPiA+ID4gKyAgICAgICBy
cS0+ZGF0YV9mcmVlID0gZGF0YS0+bmV4dDsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsgICAgICAg
ZGF0YS0+YnVmID0gYnVmOwo+ID4gPiA+ID4gKyAgICAgICBkYXRhLT5kbWEgPSBkbWE7Cj4gPiA+
ID4gPiArCj4gPiA+ID4gPiArICAgICAgIHJldHVybiBkYXRhOwo+ID4gPiA+ID4gK30KPiA+ID4g
PiA+ICsKPiA+ID4gPiA+ICtzdGF0aWMgdm9pZCAqdmlydG5ldF9ycV9nZXRfYnVmKHN0cnVjdCBy
ZWNlaXZlX3F1ZXVlICpycSwgdTMyICpsZW4sIHZvaWQgKipjdHgpCj4gPiA+ID4gPiArewo+ID4g
PiA+ID4gKyAgICAgICBzdHJ1Y3QgdmlydG5ldF9ycV9kYXRhICpkYXRhOwo+ID4gPiA+ID4gKyAg
ICAgICB2b2lkICpidWY7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArICAgICAgIGJ1ZiA9IHZpcnRx
dWV1ZV9nZXRfYnVmX2N0eChycS0+dnEsIGxlbiwgY3R4KTsKPiA+ID4gPiA+ICsgICAgICAgaWYg
KCFidWYgfHwgIXJxLT5kYXRhX2FycmF5KQo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIHJldHVy
biBidWY7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArICAgICAgIGRhdGEgPSBidWY7Cj4gPiA+ID4g
PiArCj4gPiA+ID4gPiArICAgICAgIHZpcnRuZXRfcnFfdW5tYXAocnEsIGRhdGEtPmRtYSk7Cj4g
PiA+ID4gPiArCj4gPiA+ID4gPiArICAgICAgIHJldHVybiB2aXJ0bmV0X3JxX3JlY3ljbGVfZGF0
YShycSwgZGF0YSk7Cj4gPiA+ID4gPiArfQo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gK3N0YXRpYyB2
b2lkICp2aXJ0bmV0X3JxX2RldGFjaF91bnVzZWRfYnVmKHN0cnVjdCByZWNlaXZlX3F1ZXVlICpy
cSkKPiA+ID4gPiA+ICt7Cj4gPiA+ID4gPiArICAgICAgIHN0cnVjdCB2aXJ0bmV0X3JxX2RhdGEg
KmRhdGE7Cj4gPiA+ID4gPiArICAgICAgIHZvaWQgKmJ1ZjsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+
ICsgICAgICAgYnVmID0gdmlydHF1ZXVlX2RldGFjaF91bnVzZWRfYnVmKHJxLT52cSk7Cj4gPiA+
ID4gPiArICAgICAgIGlmICghYnVmIHx8ICFycS0+ZGF0YV9hcnJheSkKPiA+ID4gPiA+ICsgICAg
ICAgICAgICAgICByZXR1cm4gYnVmOwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgICAgICBkYXRh
ID0gYnVmOwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgICAgICB2aXJ0bmV0X3JxX3VubWFwKHJx
LCBkYXRhLT5kbWEpOwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgICAgICByZXR1cm4gdmlydG5l
dF9ycV9yZWN5Y2xlX2RhdGEocnEsIGRhdGEpOwo+ID4gPiA+ID4gK30KPiA+ID4gPiA+ICsKPiA+
ID4gPiA+ICtzdGF0aWMgaW50IHZpcnRuZXRfcnFfbWFwX3NnKHN0cnVjdCByZWNlaXZlX3F1ZXVl
ICpycSwgdm9pZCAqYnVmLCB1MzIgbGVuKQo+ID4gPiA+ID4gK3sKPiA+ID4gPiA+ICsgICAgICAg
c3RydWN0IHZpcnRuZXRfcnFfZG1hICpkbWEgPSBycS0+bGFzdF9kbWE7Cj4gPiA+ID4gPiArICAg
ICAgIHN0cnVjdCBkZXZpY2UgKmRldjsKPiA+ID4gPiA+ICsgICAgICAgdTMyIG9mZiwgbWFwX2xl
bjsKPiA+ID4gPiA+ICsgICAgICAgZG1hX2FkZHJfdCBhZGRyOwo+ID4gPiA+ID4gKyAgICAgICB2
b2lkICplbmQ7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArICAgICAgIGlmIChsaWtlbHkoZG1hKSAm
JiBidWYgPj0gZG1hLT5idWYgJiYgKGJ1ZiArIGxlbiA8PSBkbWEtPmJ1ZiArIGRtYS0+bGVuKSkg
ewo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICsrZG1hLT5yZWY7Cj4gPiA+ID4gPiArICAgICAg
ICAgICAgICAgYWRkciA9IGRtYS0+YWRkciArIChidWYgLSBkbWEtPmJ1Zik7Cj4gPiA+ID4gPiAr
ICAgICAgICAgICAgICAgZ290byBvazsKPiA+ID4gPiA+ICsgICAgICAgfQo+ID4gPiA+Cj4gPiA+
ID4gU28gdGhpcyBpcyB0aGUgbWVhdCBvZiB0aGUgcHJvcG9zZWQgb3B0aW1pemF0aW9uLiBJIGd1
ZXNzIHRoYXQKPiA+ID4gPiBpZiB0aGUgbGFzdCBidWZmZXIgd2UgYWxsb2NhdGVkIGhhcHBlbnMg
dG8gYmUgaW4gdGhlIHNhbWUgcGFnZQo+ID4gPiA+IGFzIHRoaXMgb25lIHRoZW4gdGhleSBjYW4g
Ym90aCBiZSBtYXBwZWQgZm9yIERNQSB0b2dldGhlci4KPiA+ID4KPiA+ID4gU2luY2Ugd2UgdXNl
IHBhZ2VfZnJhZywgdGhlIGJ1ZmZlcnMgd2UgYWxsb2NhdGVkIGFyZSBhbGwgY29udGludW91cy4K
PiA+ID4KPiA+ID4gPiBXaHkgbGFzdCBvbmUgc3BlY2lmaWNhbGx5PyBXaGV0aGVyIG5leHQgb25l
IGhhcHBlbnMgdG8KPiA+ID4gPiBiZSBjbG9zZSBkZXBlbmRzIG9uIGx1Y2suIElmIHlvdSB3YW50
IHRvIHRyeSBvcHRpbWl6aW5nIHRoaXMKPiA+ID4gPiB0aGUgcmlnaHQgdGhpbmcgdG8gZG8gaXMg
bGlrZWx5IGJ5IHVzaW5nIGEgcGFnZSBwb29sLgo+ID4gPiA+IFRoZXJlJ3MgYWN0dWFsbHkgd29y
ayB1cHN0cmVhbSBvbiBwYWdlIHBvb2wsIGxvb2sgaXQgdXAuCj4gPiA+Cj4gPiA+IEFzIHdlIGRp
c2N1c3NlZCBpbiBhbm90aGVyIHRocmVhZCwgdGhlIHBhZ2UgcG9vbCBpcyBmaXJzdCB1c2VkIGZv
ciB4ZHAuIExldCdzCj4gPiA+IHRyYW5zZm9ybSBpdCBzdGVwIGJ5IHN0ZXAuCj4gPiA+Cj4gPiA+
IFRoYW5rcy4KPiA+Cj4gPiBvayBzbyB0aGlzIHNob3VsZCB3YWl0IHRoZW4/Cj4gPgo+ID4gPiA+
Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArICAgICAgIGVuZCA9IGJ1ZiArIGxlbiAtIDE7Cj4gPiA+
ID4gPiArICAgICAgIG9mZiA9IG9mZnNldF9pbl9wYWdlKGVuZCk7Cj4gPiA+ID4gPiArICAgICAg
IG1hcF9sZW4gPSBsZW4gKyBQQUdFX1NJWkUgLSBvZmY7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiAr
ICAgICAgIGRldiA9IHZpcnRxdWV1ZV9kbWFfZGV2KHJxLT52cSk7Cj4gPiA+ID4gPiArCj4gPiA+
ID4gPiArICAgICAgIGFkZHIgPSBkbWFfbWFwX3BhZ2VfYXR0cnMoZGV2LCB2aXJ0X3RvX3BhZ2Uo
YnVmKSwgb2Zmc2V0X2luX3BhZ2UoYnVmKSwKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBtYXBfbGVuLCBETUFfRlJPTV9ERVZJQ0UsIDApOwo+ID4gPiA+ID4gKyAg
ICAgICBpZiAoYWRkciA9PSBETUFfTUFQUElOR19FUlJPUikKPiA+ID4gPiA+ICsgICAgICAgICAg
ICAgICByZXR1cm4gLUVOT01FTTsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsgICAgICAgZG1hID0g
cnEtPmRtYV9mcmVlOwo+ID4gPiA+ID4gKyAgICAgICBycS0+ZG1hX2ZyZWUgPSBkbWEtPm5leHQ7
Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArICAgICAgIGRtYS0+cmVmID0gMTsKPiA+ID4gPiA+ICsg
ICAgICAgZG1hLT5idWYgPSBidWY7Cj4gPiA+ID4gPiArICAgICAgIGRtYS0+YWRkciA9IGFkZHI7
Cj4gPiA+ID4gPiArICAgICAgIGRtYS0+bGVuID0gbWFwX2xlbjsKPiA+ID4gPiA+ICsKPiA+ID4g
PiA+ICsgICAgICAgcnEtPmxhc3RfZG1hID0gZG1hOwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gK29r
Ogo+ID4gPiA+ID4gKyAgICAgICBzZ19pbml0X3RhYmxlKHJxLT5zZywgMSk7Cj4gPiA+ID4gPiAr
ICAgICAgIHJxLT5zZ1swXS5kbWFfYWRkcmVzcyA9IGFkZHI7Cj4gPiA+ID4gPiArICAgICAgIHJx
LT5zZ1swXS5sZW5ndGggPSBsZW47Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArICAgICAgIHJldHVy
biAwOwo+ID4gPiA+ID4gK30KPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICtzdGF0aWMgaW50IHZpcnRu
ZXRfcnFfbWVyZ2VfbWFwX2luaXQoc3RydWN0IHZpcnRuZXRfaW5mbyAqdmkpCj4gPiA+ID4gPiAr
ewo+ID4gPiA+ID4gKyAgICAgICBzdHJ1Y3QgcmVjZWl2ZV9xdWV1ZSAqcnE7Cj4gPiA+ID4gPiAr
ICAgICAgIGludCBpLCBlcnIsIGosIG51bTsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsgICAgICAg
LyogZGlzYWJsZSBmb3IgYmlnIG1vZGUgKi8KPiA+ID4gPiA+ICsgICAgICAgaWYgKCF2aS0+bWVy
Z2VhYmxlX3J4X2J1ZnMgJiYgdmktPmJpZ19wYWNrZXRzKQo+ID4gPiA+ID4gKyAgICAgICAgICAg
ICAgIHJldHVybiAwOwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgICAgICBmb3IgKGkgPSAwOyBp
IDwgdmktPm1heF9xdWV1ZV9wYWlyczsgaSsrKSB7Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAg
ZXJyID0gdmlydHF1ZXVlX3NldF9wcmVtYXBwZWQodmktPnJxW2ldLnZxKTsKPiA+ID4gPiA+ICsg
ICAgICAgICAgICAgICBpZiAoZXJyKQo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
Y29udGludWU7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgcnEgPSAmdmkt
PnJxW2ldOwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIG51bSA9IHZpcnRx
dWV1ZV9nZXRfdnJpbmdfc2l6ZShycS0+dnEpOwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgICAg
ICAgICAgICAgIHJxLT5kYXRhX2FycmF5ID0ga21hbGxvY19hcnJheShudW0sIHNpemVvZigqcnEt
PmRhdGFfYXJyYXkpLCBHRlBfS0VSTkVMKTsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBpZiAo
IXJxLT5kYXRhX2FycmF5KQo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZ290byBl
cnI7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgcnEtPmRtYV9hcnJheSA9
IGttYWxsb2NfYXJyYXkobnVtLCBzaXplb2YoKnJxLT5kbWFfYXJyYXkpLCBHRlBfS0VSTkVMKTsK
PiA+ID4gPiA+ICsgICAgICAgICAgICAgICBpZiAoIXJxLT5kbWFfYXJyYXkpCj4gPiA+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGVycjsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsg
ICAgICAgICAgICAgICBmb3IgKGogPSAwOyBqIDwgbnVtOyArK2opIHsKPiA+ID4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgIHJxLT5kYXRhX2FycmF5W2pdLm5leHQgPSBycS0+ZGF0YV9mcmVl
Owo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcnEtPmRhdGFfZnJlZSA9ICZycS0+
ZGF0YV9hcnJheVtqXTsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIHJxLT5kbWFfYXJyYXlbal0ubmV4dCA9IHJxLT5kbWFfZnJlZTsKPiA+ID4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgIHJxLT5kbWFfZnJlZSA9ICZycS0+ZG1hX2FycmF5W2pdOwo+ID4g
PiA+ID4gKyAgICAgICAgICAgICAgIH0KPiA+ID4gPiA+ICsgICAgICAgfQo+ID4gPiA+ID4gKwo+
ID4gPiA+ID4gKyAgICAgICByZXR1cm4gMDsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICtlcnI6Cj4g
PiA+ID4gPiArICAgICAgIGZvciAoaSA9IDA7IGkgPCB2aS0+bWF4X3F1ZXVlX3BhaXJzOyBpKysp
IHsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBzdHJ1Y3QgcmVjZWl2ZV9xdWV1ZSAqcnE7Cj4g
PiA+ID4gPiArCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgcnEgPSAmdmktPnJxW2ldOwo+ID4g
PiA+ID4gKwo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIGtmcmVlKHJxLT5kbWFfYXJyYXkpOwo+
ID4gPiA+ID4gKyAgICAgICAgICAgICAgIGtmcmVlKHJxLT5kYXRhX2FycmF5KTsKPiA+ID4gPiA+
ICsgICAgICAgfQo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgICAgICByZXR1cm4gLUVOT01FTTsK
PiA+ID4gPiA+ICt9Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiAgc3RhdGljIHZvaWQgZnJlZV9vbGRf
eG1pdF9za2JzKHN0cnVjdCBzZW5kX3F1ZXVlICpzcSwgYm9vbCBpbl9uYXBpKQo+ID4gPiA+ID4g
IHsKPiA+ID4gPiA+ICAgICAgICAgdW5zaWduZWQgaW50IGxlbjsKPiA+ID4gPiA+IEBAIC04MzUs
NyArMTAzMyw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGFnZSAqeGRwX2xpbmVhcml6ZV9wYWdlKHN0cnVj
dCByZWNlaXZlX3F1ZXVlICpycSwKPiA+ID4gPiA+ICAgICAgICAgICAgICAgICB2b2lkICpidWY7
Cj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgaW50IG9mZjsKPiA+ID4gPiA+Cj4gPiA+ID4gPiAt
ICAgICAgICAgICAgICAgYnVmID0gdmlydHF1ZXVlX2dldF9idWYocnEtPnZxLCAmYnVmbGVuKTsK
PiA+ID4gPiA+ICsgICAgICAgICAgICAgICBidWYgPSB2aXJ0bmV0X3JxX2dldF9idWYocnEsICZi
dWZsZW4sIE5VTEwpOwo+ID4gPiA+ID4gICAgICAgICAgICAgICAgIGlmICh1bmxpa2VseSghYnVm
KSkKPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZXJyX2J1ZjsKPiA+ID4g
PiA+Cj4gPiA+ID4gPiBAQCAtMTEyNiw3ICsxMzI0LDcgQEAgc3RhdGljIGludCB2aXJ0bmV0X2J1
aWxkX3hkcF9idWZmX21yZyhzdHJ1Y3QgbmV0X2RldmljZSAqZGV2LAo+ID4gPiA+ID4gICAgICAg
ICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4gPiA+ID4KPiA+ID4gPiA+ICAgICAgICAgd2hp
bGUgKC0tKm51bV9idWYgPiAwKSB7Cj4gPiA+ID4gPiAtICAgICAgICAgICAgICAgYnVmID0gdmly
dHF1ZXVlX2dldF9idWZfY3R4KHJxLT52cSwgJmxlbiwgJmN0eCk7Cj4gPiA+ID4gPiArICAgICAg
ICAgICAgICAgYnVmID0gdmlydG5ldF9ycV9nZXRfYnVmKHJxLCAmbGVuLCAmY3R4KTsKPiA+ID4g
PiA+ICAgICAgICAgICAgICAgICBpZiAodW5saWtlbHkoIWJ1ZikpIHsKPiA+ID4gPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgIHByX2RlYnVnKCIlczogcnggZXJyb3I6ICVkIGJ1ZmZlcnMgb3V0
IG9mICVkIG1pc3NpbmdcbiIsCj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBkZXYtPm5hbWUsICpudW1fYnVmLAo+ID4gPiA+ID4gQEAgLTEzNTEsNyArMTU0OSw3IEBA
IHN0YXRpYyBzdHJ1Y3Qgc2tfYnVmZiAqcmVjZWl2ZV9tZXJnZWFibGUoc3RydWN0IG5ldF9kZXZp
Y2UgKmRldiwKPiA+ID4gPiA+ICAgICAgICAgd2hpbGUgKC0tbnVtX2J1Zikgewo+ID4gPiA+ID4g
ICAgICAgICAgICAgICAgIGludCBudW1fc2tiX2ZyYWdzOwo+ID4gPiA+ID4KPiA+ID4gPiA+IC0g
ICAgICAgICAgICAgICBidWYgPSB2aXJ0cXVldWVfZ2V0X2J1Zl9jdHgocnEtPnZxLCAmbGVuLCAm
Y3R4KTsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBidWYgPSB2aXJ0bmV0X3JxX2dldF9idWYo
cnEsICZsZW4sICZjdHgpOwo+ID4gPiA+ID4gICAgICAgICAgICAgICAgIGlmICh1bmxpa2VseSgh
YnVmKSkgewo+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgcHJfZGVidWcoIiVzOiBy
eCBlcnJvcjogJWQgYnVmZmVycyBvdXQgb2YgJWQgbWlzc2luZ1xuIiwKPiA+ID4gPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRldi0+bmFtZSwgbnVtX2J1ZiwKPiA+ID4gPiA+
IEBAIC0xNDE0LDcgKzE2MTIsNyBAQCBzdGF0aWMgc3RydWN0IHNrX2J1ZmYgKnJlY2VpdmVfbWVy
Z2VhYmxlKHN0cnVjdCBuZXRfZGV2aWNlICpkZXYsCj4gPiA+ID4gPiAgZXJyX3NrYjoKPiA+ID4g
PiA+ICAgICAgICAgcHV0X3BhZ2UocGFnZSk7Cj4gPiA+ID4gPiAgICAgICAgIHdoaWxlIChudW1f
YnVmLS0gPiAxKSB7Cj4gPiA+ID4gPiAtICAgICAgICAgICAgICAgYnVmID0gdmlydHF1ZXVlX2dl
dF9idWYocnEtPnZxLCAmbGVuKTsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBidWYgPSB2aXJ0
bmV0X3JxX2dldF9idWYocnEsICZsZW4sIE5VTEwpOwo+ID4gPiA+ID4gICAgICAgICAgICAgICAg
IGlmICh1bmxpa2VseSghYnVmKSkgewo+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
cHJfZGVidWcoIiVzOiByeCBlcnJvcjogJWQgYnVmZmVycyBtaXNzaW5nXG4iLAo+ID4gPiA+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGV2LT5uYW1lLCBudW1fYnVmKTsKPiA+
ID4gPiA+IEBAIC0xNTI5LDYgKzE3MjcsNyBAQCBzdGF0aWMgaW50IGFkZF9yZWN2YnVmX3NtYWxs
KHN0cnVjdCB2aXJ0bmV0X2luZm8gKnZpLCBzdHJ1Y3QgcmVjZWl2ZV9xdWV1ZSAqcnEsCj4gPiA+
ID4gPiAgICAgICAgIHVuc2lnbmVkIGludCB4ZHBfaGVhZHJvb20gPSB2aXJ0bmV0X2dldF9oZWFk
cm9vbSh2aSk7Cj4gPiA+ID4gPiAgICAgICAgIHZvaWQgKmN0eCA9ICh2b2lkICopKHVuc2lnbmVk
IGxvbmcpeGRwX2hlYWRyb29tOwo+ID4gPiA+ID4gICAgICAgICBpbnQgbGVuID0gdmktPmhkcl9s
ZW4gKyBWSVJUTkVUX1JYX1BBRCArIEdPT0RfUEFDS0VUX0xFTiArIHhkcF9oZWFkcm9vbTsKPiA+
ID4gPiA+ICsgICAgICAgc3RydWN0IHZpcnRuZXRfcnFfZGF0YSAqZGF0YTsKPiA+ID4gPiA+ICAg
ICAgICAgaW50IGVycjsKPiA+ID4gPiA+Cj4gPiA+ID4gPiAgICAgICAgIGxlbiA9IFNLQl9EQVRB
X0FMSUdOKGxlbikgKwo+ID4gPiA+ID4gQEAgLTE1MzksMTEgKzE3MzgsMzQgQEAgc3RhdGljIGlu
dCBhZGRfcmVjdmJ1Zl9zbWFsbChzdHJ1Y3QgdmlydG5ldF9pbmZvICp2aSwgc3RydWN0IHJlY2Vp
dmVfcXVldWUgKnJxLAo+ID4gPiA+ID4gICAgICAgICBidWYgPSAoY2hhciAqKXBhZ2VfYWRkcmVz
cyhhbGxvY19mcmFnLT5wYWdlKSArIGFsbG9jX2ZyYWctPm9mZnNldDsKPiA+ID4gPiA+ICAgICAg
ICAgZ2V0X3BhZ2UoYWxsb2NfZnJhZy0+cGFnZSk7Cj4gPiA+ID4gPiAgICAgICAgIGFsbG9jX2Zy
YWctPm9mZnNldCArPSBsZW47Cj4gPiA+ID4gPiAtICAgICAgIHNnX2luaXRfb25lKHJxLT5zZywg
YnVmICsgVklSVE5FVF9SWF9QQUQgKyB4ZHBfaGVhZHJvb20sCj4gPiA+ID4gPiAtICAgICAgICAg
ICAgICAgICAgIHZpLT5oZHJfbGVuICsgR09PRF9QQUNLRVRfTEVOKTsKPiA+ID4gPiA+IC0gICAg
ICAgZXJyID0gdmlydHF1ZXVlX2FkZF9pbmJ1Zl9jdHgocnEtPnZxLCBycS0+c2csIDEsIGJ1Ziwg
Y3R4LCBnZnApOwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgICAgICBpZiAocnEtPmRhdGFfYXJy
YXkpIHsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBlcnIgPSB2aXJ0bmV0X3JxX21hcF9zZyhy
cSwgYnVmICsgVklSVE5FVF9SWF9QQUQgKyB4ZHBfaGVhZHJvb20sCj4gPiA+ID4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdmktPmhkcl9sZW4gKyBHT09EX1BBQ0tF
VF9MRU4pOwo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIGlmIChlcnIpCj4gPiA+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgICBnb3RvIG1hcF9lcnI7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiAr
ICAgICAgICAgICAgICAgZGF0YSA9IHZpcnRuZXRfcnFfZ2V0X2RhdGEocnEsIGJ1ZiwgcnEtPmxh
c3RfZG1hKTsKPiA+ID4gPiA+ICsgICAgICAgfSBlbHNlIHsKPiA+ID4gPiA+ICsgICAgICAgICAg
ICAgICBzZ19pbml0X29uZShycS0+c2csIGJ1ZiArIFZJUlRORVRfUlhfUEFEICsgeGRwX2hlYWRy
b29tLAo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIHZpLT5oZHJfbGVuICsg
R09PRF9QQUNLRVRfTEVOKTsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBkYXRhID0gKHZvaWQg
KilidWY7Cj4gPiA+ID4gPiArICAgICAgIH0KPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsgICAgICAg
ZXJyID0gdmlydHF1ZXVlX2FkZF9pbmJ1Zl9jdHgocnEtPnZxLCBycS0+c2csIDEsIGRhdGEsIGN0
eCwgZ2ZwKTsKPiA+ID4gPiA+ICAgICAgICAgaWYgKGVyciA8IDApCj4gPiA+ID4gPiAtICAgICAg
ICAgICAgICAgcHV0X3BhZ2UodmlydF90b19oZWFkX3BhZ2UoYnVmKSk7Cj4gPiA+ID4gPiArICAg
ICAgICAgICAgICAgZ290byBhZGRfZXJyOwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgICAgICBy
ZXR1cm4gZXJyOwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gK2FkZF9lcnI6Cj4gPiA+ID4gPiArICAg
ICAgIGlmIChycS0+ZGF0YV9hcnJheSkgewo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIHZpcnRu
ZXRfcnFfdW5tYXAocnEsIGRhdGEtPmRtYSk7Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAgdmly
dG5ldF9ycV9yZWN5Y2xlX2RhdGEocnEsIGRhdGEpOwo+ID4gPiA+ID4gKyAgICAgICB9Cj4gPiA+
ID4gPiArCj4gPiA+ID4gPiArbWFwX2VycjoKPiA+ID4gPiA+ICsgICAgICAgcHV0X3BhZ2Uodmly
dF90b19oZWFkX3BhZ2UoYnVmKSk7Cj4gPiA+ID4gPiAgICAgICAgIHJldHVybiBlcnI7Cj4gPiA+
ID4gPiAgfQo+ID4gPiA+ID4KPiA+ID4gPiA+IEBAIC0xNjIwLDYgKzE4NDIsNyBAQCBzdGF0aWMg
aW50IGFkZF9yZWN2YnVmX21lcmdlYWJsZShzdHJ1Y3QgdmlydG5ldF9pbmZvICp2aSwKPiA+ID4g
PiA+ICAgICAgICAgdW5zaWduZWQgaW50IGhlYWRyb29tID0gdmlydG5ldF9nZXRfaGVhZHJvb20o
dmkpOwo+ID4gPiA+ID4gICAgICAgICB1bnNpZ25lZCBpbnQgdGFpbHJvb20gPSBoZWFkcm9vbSA/
IHNpemVvZihzdHJ1Y3Qgc2tiX3NoYXJlZF9pbmZvKSA6IDA7Cj4gPiA+ID4gPiAgICAgICAgIHVu
c2lnbmVkIGludCByb29tID0gU0tCX0RBVEFfQUxJR04oaGVhZHJvb20gKyB0YWlscm9vbSk7Cj4g
PiA+ID4gPiArICAgICAgIHN0cnVjdCB2aXJ0bmV0X3JxX2RhdGEgKmRhdGE7Cj4gPiA+ID4gPiAg
ICAgICAgIGNoYXIgKmJ1ZjsKPiA+ID4gPiA+ICAgICAgICAgdm9pZCAqY3R4Owo+ID4gPiA+ID4g
ICAgICAgICBpbnQgZXJyOwo+ID4gPiA+ID4gQEAgLTE2NTAsMTIgKzE4NzMsMzIgQEAgc3RhdGlj
IGludCBhZGRfcmVjdmJ1Zl9tZXJnZWFibGUoc3RydWN0IHZpcnRuZXRfaW5mbyAqdmksCj4gPiA+
ID4gPiAgICAgICAgICAgICAgICAgYWxsb2NfZnJhZy0+b2Zmc2V0ICs9IGhvbGU7Cj4gPiA+ID4g
PiAgICAgICAgIH0KPiA+ID4gPiA+Cj4gPiA+ID4gPiAtICAgICAgIHNnX2luaXRfb25lKHJxLT5z
ZywgYnVmLCBsZW4pOwo+ID4gPiA+ID4gKyAgICAgICBpZiAocnEtPmRhdGFfYXJyYXkpIHsKPiA+
ID4gPiA+ICsgICAgICAgICAgICAgICBlcnIgPSB2aXJ0bmV0X3JxX21hcF9zZyhycSwgYnVmLCBs
ZW4pOwo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIGlmIChlcnIpCj4gPiA+ID4gPiArICAgICAg
ICAgICAgICAgICAgICAgICBnb3RvIG1hcF9lcnI7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArICAg
ICAgICAgICAgICAgZGF0YSA9IHZpcnRuZXRfcnFfZ2V0X2RhdGEocnEsIGJ1ZiwgcnEtPmxhc3Rf
ZG1hKTsKPiA+ID4gPiA+ICsgICAgICAgfSBlbHNlIHsKPiA+ID4gPiA+ICsgICAgICAgICAgICAg
ICBzZ19pbml0X29uZShycS0+c2csIGJ1ZiwgbGVuKTsKPiA+ID4gPiA+ICsgICAgICAgICAgICAg
ICBkYXRhID0gKHZvaWQgKilidWY7Cj4gPiA+ID4gPiArICAgICAgIH0KPiA+ID4gPiA+ICsKPiA+
ID4gPiA+ICAgICAgICAgY3R4ID0gbWVyZ2VhYmxlX2xlbl90b19jdHgobGVuICsgcm9vbSwgaGVh
ZHJvb20pOwo+ID4gPiA+ID4gLSAgICAgICBlcnIgPSB2aXJ0cXVldWVfYWRkX2luYnVmX2N0eChy
cS0+dnEsIHJxLT5zZywgMSwgYnVmLCBjdHgsIGdmcCk7Cj4gPiA+ID4gPiArICAgICAgIGVyciA9
IHZpcnRxdWV1ZV9hZGRfaW5idWZfY3R4KHJxLT52cSwgcnEtPnNnLCAxLCBkYXRhLCBjdHgsIGdm
cCk7Cj4gPiA+ID4gPiAgICAgICAgIGlmIChlcnIgPCAwKQo+ID4gPiA+ID4gLSAgICAgICAgICAg
ICAgIHB1dF9wYWdlKHZpcnRfdG9faGVhZF9wYWdlKGJ1ZikpOwo+ID4gPiA+ID4gKyAgICAgICAg
ICAgICAgIGdvdG8gYWRkX2VycjsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsgICAgICAgcmV0dXJu
IDA7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArYWRkX2VycjoKPiA+ID4gPiA+ICsgICAgICAgaWYg
KHJxLT5kYXRhX2FycmF5KSB7Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAgdmlydG5ldF9ycV91
bm1hcChycSwgZGF0YS0+ZG1hKTsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICB2aXJ0bmV0X3Jx
X3JlY3ljbGVfZGF0YShycSwgZGF0YSk7Cj4gPiA+ID4gPiArICAgICAgIH0KPiA+ID4gPiA+Cj4g
PiA+ID4gPiArbWFwX2VycjoKPiA+ID4gPiA+ICsgICAgICAgcHV0X3BhZ2UodmlydF90b19oZWFk
X3BhZ2UoYnVmKSk7Cj4gPiA+ID4gPiAgICAgICAgIHJldHVybiBlcnI7Cj4gPiA+ID4gPiAgfQo+
ID4gPiA+ID4KPiA+ID4gPiA+IEBAIC0xNzc1LDEzICsyMDE4LDEzIEBAIHN0YXRpYyBpbnQgdmly
dG5ldF9yZWNlaXZlKHN0cnVjdCByZWNlaXZlX3F1ZXVlICpycSwgaW50IGJ1ZGdldCwKPiA+ID4g
PiA+ICAgICAgICAgICAgICAgICB2b2lkICpjdHg7Cj4gPiA+ID4gPgo+ID4gPiA+ID4gICAgICAg
ICAgICAgICAgIHdoaWxlIChzdGF0cy5wYWNrZXRzIDwgYnVkZ2V0ICYmCj4gPiA+ID4gPiAtICAg
ICAgICAgICAgICAgICAgICAgIChidWYgPSB2aXJ0cXVldWVfZ2V0X2J1Zl9jdHgocnEtPnZxLCAm
bGVuLCAmY3R4KSkpIHsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgKGJ1ZiA9IHZp
cnRuZXRfcnFfZ2V0X2J1ZihycSwgJmxlbiwgJmN0eCkpKSB7Cj4gPiA+ID4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICByZWNlaXZlX2J1Zih2aSwgcnEsIGJ1ZiwgbGVuLCBjdHgsIHhkcF94bWl0
LCAmc3RhdHMpOwo+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgc3RhdHMucGFja2V0
cysrOwo+ID4gPiA+ID4gICAgICAgICAgICAgICAgIH0KPiA+ID4gPiA+ICAgICAgICAgfSBlbHNl
IHsKPiA+ID4gPiA+ICAgICAgICAgICAgICAgICB3aGlsZSAoc3RhdHMucGFja2V0cyA8IGJ1ZGdl
dCAmJgo+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAoYnVmID0gdmlydHF1ZXVlX2dl
dF9idWYocnEtPnZxLCAmbGVuKSkgIT0gTlVMTCkgewo+ID4gPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAoYnVmID0gdmlydG5ldF9ycV9nZXRfYnVmKHJxLCAmbGVuLCBOVUxMKSkgIT0gTlVM
TCkgewo+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgcmVjZWl2ZV9idWYodmksIHJx
LCBidWYsIGxlbiwgTlVMTCwgeGRwX3htaXQsICZzdGF0cyk7Cj4gPiA+ID4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICBzdGF0cy5wYWNrZXRzKys7Cj4gPiA+ID4gPiAgICAgICAgICAgICAgICAg
fQo+ID4gPiA+ID4gQEAgLTM1MTQsNiArMzc1Nyw5IEBAIHN0YXRpYyB2b2lkIHZpcnRuZXRfZnJl
ZV9xdWV1ZXMoc3RydWN0IHZpcnRuZXRfaW5mbyAqdmkpCj4gPiA+ID4gPiAgICAgICAgIGZvciAo
aSA9IDA7IGkgPCB2aS0+bWF4X3F1ZXVlX3BhaXJzOyBpKyspIHsKPiA+ID4gPiA+ICAgICAgICAg
ICAgICAgICBfX25ldGlmX25hcGlfZGVsKCZ2aS0+cnFbaV0ubmFwaSk7Cj4gPiA+ID4gPiAgICAg
ICAgICAgICAgICAgX19uZXRpZl9uYXBpX2RlbCgmdmktPnNxW2ldLm5hcGkpOwo+ID4gPiA+ID4g
Kwo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIGtmcmVlKHZpLT5ycVtpXS5kYXRhX2FycmF5KTsK
PiA+ID4gPiA+ICsgICAgICAgICAgICAgICBrZnJlZSh2aS0+cnFbaV0uZG1hX2FycmF5KTsKPiA+
ID4gPiA+ICAgICAgICAgfQo+ID4gPiA+ID4KPiA+ID4gPiA+ICAgICAgICAgLyogV2UgY2FsbGVk
IF9fbmV0aWZfbmFwaV9kZWwoKSwKPiA+ID4gPiA+IEBAIC0zNTkxLDkgKzM4MzcsMTAgQEAgc3Rh
dGljIHZvaWQgZnJlZV91bnVzZWRfYnVmcyhzdHJ1Y3QgdmlydG5ldF9pbmZvICp2aSkKPiA+ID4g
PiA+ICAgICAgICAgfQo+ID4gPiA+ID4KPiA+ID4gPiA+ICAgICAgICAgZm9yIChpID0gMDsgaSA8
IHZpLT5tYXhfcXVldWVfcGFpcnM7IGkrKykgewo+ID4gPiA+ID4gLSAgICAgICAgICAgICAgIHN0
cnVjdCB2aXJ0cXVldWUgKnZxID0gdmktPnJxW2ldLnZxOwo+ID4gPiA+ID4gLSAgICAgICAgICAg
ICAgIHdoaWxlICgoYnVmID0gdmlydHF1ZXVlX2RldGFjaF91bnVzZWRfYnVmKHZxKSkgIT0gTlVM
TCkKPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIHZpcnRuZXRfcnFfZnJlZV91bnVz
ZWRfYnVmKHZxLCBidWYpOwo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIHN0cnVjdCByZWNlaXZl
X3F1ZXVlICpycSA9ICZ2aS0+cnFbaV07Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArICAgICAgICAg
ICAgICAgd2hpbGUgKChidWYgPSB2aXJ0bmV0X3JxX2RldGFjaF91bnVzZWRfYnVmKHJxKSkgIT0g
TlVMTCkKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHZpcnRuZXRfcnFfZnJlZV91
bnVzZWRfYnVmKHJxLT52cSwgYnVmKTsKPiA+ID4gPiA+ICAgICAgICAgICAgICAgICBjb25kX3Jl
c2NoZWQoKTsKPiA+ID4gPiA+ICAgICAgICAgfQo+ID4gPiA+ID4gIH0KPiA+ID4gPiA+IEBAIC0z
NzY3LDYgKzQwMTQsMTAgQEAgc3RhdGljIGludCBpbml0X3ZxcyhzdHJ1Y3QgdmlydG5ldF9pbmZv
ICp2aSkKPiA+ID4gPiA+ICAgICAgICAgaWYgKHJldCkKPiA+ID4gPiA+ICAgICAgICAgICAgICAg
ICBnb3RvIGVycl9mcmVlOwo+ID4gPiA+ID4KPiA+ID4gPiA+ICsgICAgICAgcmV0ID0gdmlydG5l
dF9ycV9tZXJnZV9tYXBfaW5pdCh2aSk7Cj4gPiA+ID4gPiArICAgICAgIGlmIChyZXQpCj4gPiA+
ID4gPiArICAgICAgICAgICAgICAgZ290byBlcnJfZnJlZTsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+
ICAgICAgICAgY3B1c19yZWFkX2xvY2soKTsKPiA+ID4gPiA+ICAgICAgICAgdmlydG5ldF9zZXRf
YWZmaW5pdHkodmkpOwo+ID4gPiA+ID4gICAgICAgICBjcHVzX3JlYWRfdW5sb2NrKCk7Cj4gPiA+
ID4gPiAtLQo+ID4gPiA+ID4gMi4zMi4wLjMuZzAxMTk1Y2Y5Zgo+ID4gPiA+Cj4gPgo+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlv
biBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcK
aHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVh
bGl6YXRpb24=
