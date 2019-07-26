Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 577247698C
	for <lists.virtualization@lfdr.de>; Fri, 26 Jul 2019 15:53:14 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C8644DA7;
	Fri, 26 Jul 2019 13:53:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4EF59C6F
	for <virtualization@lists.linux-foundation.org>;
	Fri, 26 Jul 2019 13:53:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DE555709
	for <virtualization@lists.linux-foundation.org>;
	Fri, 26 Jul 2019 13:53:05 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id n11so52621834qtl.5
	for <virtualization@lists.linux-foundation.org>;
	Fri, 26 Jul 2019 06:53:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=AG8g0/5+Esm5c3gfwUTGC7xBT2DUyGJWbBLEtSQE6Lo=;
	b=rdJ5YWtqE73DwOjj2g85zqUYo+ptK7yugoWCxKMgkroQ1s4GClVXf/ZZY1p/CPEjQa
	6S/CwOImMetpM8UIM6f6eyeKCqUpMGPdSBa5j3aHgrLlEmGTT07DEMHaTlWhZ2b7RCN/
	7WTAx3Eo2rbeNgmQn55TifNtKTNyhviXPJnMy7t4kEZwos+FUaRRxYkD5mRSe6QwMnfs
	GAeYXOd1K7KjjDZzmldBx1hDxPVDSQ3kjkHynD8h/f3iOd1hkjP4xLNxwJAEW9HR4QKX
	9T19BZTIcIcEgAhiS5tjh/fN3qiu4w28syxFbBZAKr6RAatIFKaBYWIZD/GChxJKSwjJ
	u40Q==
X-Gm-Message-State: APjAAAVitb45rUWLVJRuOTRL3dtVFxrE2WW+K2JtPzRZRuXF00NsPDTD
	nqcz/YIDcEQo6FM5QLR3+fHrfQ==
X-Google-Smtp-Source: APXvYqydwEkRiDUhjkzyGjQfoaMf8JbYOCxKxauTFB3YoeZG49kK7ARiVn02SSH3ZF9H39y3z1BKaA==
X-Received: by 2002:a0c:b521:: with SMTP id d33mr68309462qve.239.1564149185035;
	Fri, 26 Jul 2019 06:53:05 -0700 (PDT)
Received: from redhat.com ([212.92.104.165]) by smtp.gmail.com with ESMTPSA id
	v17sm30156688qtc.23.2019.07.26.06.53.02
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 26 Jul 2019 06:53:04 -0700 (PDT)
Date: Fri, 26 Jul 2019 09:52:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] vhost: disable metadata prefetch optimization
Message-ID: <20190726095044-mutt-send-email-mst@kernel.org>
References: <20190726115021.7319-1-mst@redhat.com>
	<ccba99c1-7708-3e55-6fc9-7775415c77a8@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ccba99c1-7708-3e55-6fc9-7775415c77a8@redhat.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org
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

T24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMDc6NTc6MjVQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzcvMjYg5LiL5Y2INzo1MSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gVGhpcyBzZWVtcyB0byBjYXVzZSBndWVzdCBhbmQgaG9zdCBtZW1vcnkgY29ycnVwdGlv
bi4KPiA+IERpc2FibGUgZm9yIG5vdyB1bnRpbCB3ZSBnZXQgYSBiZXR0ZXIgaGFuZGxlIG9uIHRo
YXQuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhh
dC5jb20+Cj4gPiAtLS0KPiA+IAo+ID4gSSBwdXQgdGhpcyBpbiBsaW51eC1uZXh0LCB3ZSdsbCBy
ZS1lbmFibGUgaWYgd2UgY2FuIGZpeAo+ID4gdGhlIG91dHN0YW5kaW5nIGlzc3VlcyBpbiBhIHNo
b3J0IG9yZGVyLgo+IAo+IAo+IEJ0dywgaXMgdGhpcyBtb3JlIHN1aXRhYmxlIHRvIGUuZyByZXZl
cnQgdGhlCj4gODQyYWE2NGVkZGFjZDIzYWRjNmVjZGJjNjljYjIwMzBiZWM0NzEyMgoKWWVzIEkg
ZGlkIHRoYXQgdG9vLgoKPiBhbmQgbGV0IHN5emJvdCBmdXp6IG1vcmUgb24gdGhlCj4gY3VycmVu
dCBjb2RlPwoKQ3VycmVudCBtZXRhZGF0YSBkaXJlY3QgYWNjZXNzIGNvZGUgaXMga25vd24gdG8g
Y29ycnVwdCBndWVzdCBhbmQgaG9zdAptZW1vcnkgLSBJIGRvbid0IGZlZWwgd2UgbmVlZCBtb3Jl
IGZ1enppbmcuCgo+IAo+IEkgdGhpbmsgd2Ugd29uJ3QgYWNjZXB0IHRoYXQgcGF0Y2ggZXZlbnR1
YWxseSwgc28gSSBzdXNwZWN0IHdoYXQgc3l6Ym90Cj4gcmVwb3J0cyB0b2RheSBpcyBhIGZhbHNl
IHBvc2l0aXZlcy4KClRvZGF5J3MgcmVwb3J0cyBhcmUgcmVhbCwgaXQncyBhIGJ1ZyBpbiBteSBw
YXRjaC4gQnV0IEkgcmV2ZXJ0ZWQgaXQgLQp0aGUgYmVsb3cgaXMgYW4gZWFzaWVyIHdheSB0byBt
YWtlIHN1cmUgYXQgbGVhc3QgbGludXgtbmV4dCBpcyBzdGFibGUKZm9yIGV2ZXJ5b25lLgoKPiAK
PiBUaGFua3MKPiAKPiAKPiA+IAo+ID4gICBkcml2ZXJzL3Zob3N0L3Zob3N0LmggfCAyICstCj4g
PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4gCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aG9zdC92aG9zdC5oIGIvZHJpdmVycy92aG9zdC92aG9z
dC5oCj4gPiBpbmRleCA4MTkyOTYzMzI5MTMuLjQyYThjMmExM2FiMSAxMDA2NDQKPiA+IC0tLSBh
L2RyaXZlcnMvdmhvc3Qvdmhvc3QuaAo+ID4gKysrIGIvZHJpdmVycy92aG9zdC92aG9zdC5oCj4g
PiBAQCAtOTYsNyArOTYsNyBAQCBzdHJ1Y3Qgdmhvc3RfdWFkZHIgewo+ID4gICB9Owo+ID4gICAj
aWYgZGVmaW5lZChDT05GSUdfTU1VX05PVElGSUVSKSAmJiBBUkNIX0lNUExFTUVOVFNfRkxVU0hf
RENBQ0hFX1BBR0UgPT0gMAo+ID4gLSNkZWZpbmUgVkhPU1RfQVJDSF9DQU5fQUNDRUxfVUFDQ0VT
UyAxCj4gPiArI2RlZmluZSBWSE9TVF9BUkNIX0NBTl9BQ0NFTF9VQUNDRVNTIDAKPiA+ICAgI2Vs
c2UKPiA+ICAgI2RlZmluZSBWSE9TVF9BUkNIX0NBTl9BQ0NFTF9VQUNDRVNTIDAKPiA+ICAgI2Vu
ZGlmCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1
YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0
aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5m
by92aXJ0dWFsaXphdGlvbg==
