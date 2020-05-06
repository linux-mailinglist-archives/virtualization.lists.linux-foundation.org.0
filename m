Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B921C6DB4
	for <lists.virtualization@lfdr.de>; Wed,  6 May 2020 11:54:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D6FC287857;
	Wed,  6 May 2020 09:54:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YytiQ3es2H6a; Wed,  6 May 2020 09:54:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id ED3D387855;
	Wed,  6 May 2020 09:54:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C9C4DC0859;
	Wed,  6 May 2020 09:54:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 42ADDC0859
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 09:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2F44188592
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 09:54:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sH5Uu1RGDrAz
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 09:54:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E5C7C8858D
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 09:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588758892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IQgpC6M6Fr0QXYCApTnYcfdrhwDOylYbkH9y+/KvXfc=;
 b=hmbXPHaj7wcMFWHWhLB+KyzYOJ3kYIra2QN6R7vzel9ao4Jb9DjGLwKBctklHGViF46tRu
 ogsW7rM0r9JtpjXQbu4xikgRiPr3vbWMvVgiL3dtEluRbYwuqjrsP2Wv8+hBTMsju3fF+r
 uGjV5GiG7YYSlxezm4JItFopsjPenmM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30--xbvzsjyPCeweTJoRVBFJw-1; Wed, 06 May 2020 05:54:51 -0400
X-MC-Unique: -xbvzsjyPCeweTJoRVBFJw-1
Received: by mail-wm1-f69.google.com with SMTP id w2so939895wmc.3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 06 May 2020 02:54:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=IQgpC6M6Fr0QXYCApTnYcfdrhwDOylYbkH9y+/KvXfc=;
 b=G0XWliO8t3z6gkkegj6aN9tx/3JBNbtId7UU9+MO4ngtp2p5o36m540llw89O9BOmH
 GnDfxjfBPBUGA5JnyxVMo0oE75WV8CUPsy+M9CpoK1DDV8LeuLuV+MMOW/h7K6EsMCZ3
 pSi2E8e8tg3+V1yAr+wSKaDRvK9o0X3f+VqPnHZMB7VUdfqd24OlCLAmU/pK6mftx0Fg
 uRrVLS+jtQpzwhmiFfjo43Dk60J/GXJSwnKa5LlyArF1ECUVjIUR6z/+aEe22zlxwbdK
 D2Z9Tb+bCnm/3Rg9Nc/Y8dy0/rzsKEK4Vhm/jarQf0XNkviHKFfR24cKjzxLoVDLhBjM
 jl8A==
X-Gm-Message-State: AGi0PuYGDnlFZBwT9SpmFSh7j3nbEL7NtnfbQDB6NQR99z48mcdCJIb3
 5W1/dmDYqbnKHLpoahha7LhBQYRIbhWJihL7i057CCk9Lp8rOPcGA9OevBW0Q7ZTPRmhICClH4z
 9wRYrHAeSuGPLpMOuRI+u8z5suyINrnuZXf1pxeGHGg==
X-Received: by 2002:a1c:2383:: with SMTP id j125mr3560322wmj.6.1588758889754; 
 Wed, 06 May 2020 02:54:49 -0700 (PDT)
X-Google-Smtp-Source: APiQypKtmLaaSMrbt2AgLvxUJBNSQPFDRBWOY4wRUCKhGIWK+KiuCn92js4GGRYIiEgbL9ZdbdY9GA==
X-Received: by 2002:a1c:2383:: with SMTP id j125mr3560305wmj.6.1588758889563; 
 Wed, 06 May 2020 02:54:49 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 r3sm1922605wrx.72.2020.05.06.02.54.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 02:54:49 -0700 (PDT)
Date: Wed, 6 May 2020 05:54:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH net-next 1/2] virtio-net: don't reserve space for vnet
 header for XDP
Message-ID: <20200506055436-mutt-send-email-mst@kernel.org>
References: <20200506061633.16327-1-jasowang@redhat.com>
 <20200506033834-mutt-send-email-mst@kernel.org>
 <7a169b06-b6b9-eac1-f03a-39dd1cfcce57@redhat.com>
MIME-Version: 1.0
In-Reply-To: <7a169b06-b6b9-eac1-f03a-39dd1cfcce57@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org,
 Jesper Dangaard Brouer <brouer@redhat.com>, linux-kernel@vger.kernel.org,
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

T24gV2VkLCBNYXkgMDYsIDIwMjAgYXQgMDQ6MTk6NDBQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzUvNiDkuIvljYgzOjUzLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6
Cj4gPiBPbiBXZWQsIE1heSAwNiwgMjAyMCBhdCAwMjoxNjozMlBNICswODAwLCBKYXNvbiBXYW5n
IHdyb3RlOgo+ID4gPiBXZSB0cmllZCB0byByZXNlcnZlIHNwYWNlIGZvciB2bmV0IGhlYWRlciBi
ZWZvcmUKPiA+ID4geGRwLmRhdGFfaGFyZF9zdGFydC4gQnV0IHRoaXMgaXMgdXNlbGVzcyBzaW5j
ZSB0aGUgcGFja2V0IGNvdWxkIGJlCj4gPiA+IG1vZGlmaWVkIGJ5IFhEUCB3aGljaCBtYXkgaW52
YWxpZGF0ZSB0aGUgaW5mb3JtYXRpb24gc3RvcmVkIGluIHRoZQo+ID4gPiBoZWFkZXIgYW5kIHRo
ZXJlJ3Mgbm8gd2F5IGZvciBYRFAgdG8ga25vdyB0aGUgZXhpc3RlbmNlIG9mIHRoZSB2bmV0Cj4g
PiA+IGhlYWRlciBjdXJyZW50bHkuCj4gPiBXaGF0IGRvIHlvdSBtZWFuPyBEb2Vzbid0IFhEUF9Q
QVNTIHVzZSB0aGUgaGVhZGVyIGluIHRoZSBidWZmZXI/Cj4gCj4gCj4gV2UgZG9uJ3QsIHNlZSA0
MzZjOTQ1M2ExYWMwICgidmlydGlvLW5ldDoga2VlcCB2bmV0IGhlYWRlciB6ZXJvZWQgYWZ0ZXIK
PiBwcm9jZXNzaW5nIFhEUCIpCj4gCj4gSWYgdGhlcmUncyBvdGhlciBwbGFjZSwgaXQgc2hvdWxk
IGJlIGEgYnVnLgo+IAo+IAo+ID4gCj4gPiA+IFNvIGxldCdzIGp1c3Qgbm90IHJlc2VydmUgc3Bh
Y2UgZm9yIHZuZXQgaGVhZGVyIGluIHRoaXMgY2FzZS4KPiA+IEluIGFueSBjYXNlLCB3ZSBjYW4g
ZmluZCBvdXQgWERQIGRvZXMgaGVhZCBhZGp1c3RtZW50cwo+ID4gaWYgd2UgbmVlZCB0by4KPiAK
PiAKPiBCdXQgWERQIHByb2dyYW0gY2FuIG1vZGlmeSB0aGUgcGFja2V0cyB3aXRob3V0IGFkanVz
dGluZyBoZWFkZXJzLgo+IAo+IFRoYW5rcwoKVGhlbiB3aGF0J3MgdGhlIHByb2JsZW0/Cgo+IAo+
ID4gCj4gPiAKPiA+ID4gQ2M6IEplc3BlciBEYW5nYWFyZCBCcm91ZXIgPGJyb3VlckByZWRoYXQu
Y29tPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29t
Pgo+ID4gPiAtLS0KPiA+ID4gICBkcml2ZXJzL25ldC92aXJ0aW9fbmV0LmMgfCA2ICsrKy0tLQo+
ID4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4g
PiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvdmlydGlvX25ldC5jIGIvZHJpdmVy
cy9uZXQvdmlydGlvX25ldC5jCj4gPiA+IGluZGV4IDExZjcyMjQ2MDUxMy4uOThkZDc1YjY2NWE1
IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL25ldC92aXJ0aW9fbmV0LmMKPiA+ID4gKysrIGIv
ZHJpdmVycy9uZXQvdmlydGlvX25ldC5jCj4gPiA+IEBAIC02ODQsOCArNjg0LDggQEAgc3RhdGlj
IHN0cnVjdCBza19idWZmICpyZWNlaXZlX3NtYWxsKHN0cnVjdCBuZXRfZGV2aWNlICpkZXYsCj4g
PiA+ICAgCQkJcGFnZSA9IHhkcF9wYWdlOwo+ID4gPiAgIAkJfQo+ID4gPiAtCQl4ZHAuZGF0YV9o
YXJkX3N0YXJ0ID0gYnVmICsgVklSVE5FVF9SWF9QQUQgKyB2aS0+aGRyX2xlbjsKPiA+ID4gLQkJ
eGRwLmRhdGEgPSB4ZHAuZGF0YV9oYXJkX3N0YXJ0ICsgeGRwX2hlYWRyb29tOwo+ID4gPiArCQl4
ZHAuZGF0YV9oYXJkX3N0YXJ0ID0gYnVmICsgVklSVE5FVF9SWF9QQUQ7Cj4gPiA+ICsJCXhkcC5k
YXRhID0geGRwLmRhdGFfaGFyZF9zdGFydCArIHhkcF9oZWFkcm9vbSArIHZpLT5oZHJfbGVuOwo+
ID4gPiAgIAkJeGRwLmRhdGFfZW5kID0geGRwLmRhdGEgKyBsZW47Cj4gPiA+ICAgCQl4ZHAuZGF0
YV9tZXRhID0geGRwLmRhdGE7Cj4gPiA+ICAgCQl4ZHAucnhxID0gJnJxLT54ZHBfcnhxOwo+ID4g
PiBAQCAtODQ1LDcgKzg0NSw3IEBAIHN0YXRpYyBzdHJ1Y3Qgc2tfYnVmZiAqcmVjZWl2ZV9tZXJn
ZWFibGUoc3RydWN0IG5ldF9kZXZpY2UgKmRldiwKPiA+ID4gICAJCSAqIHRoZSBkZXNjcmlwdG9y
IG9uIGlmIHdlIGdldCBhbiBYRFBfVFggcmV0dXJuIGNvZGUuCj4gPiA+ICAgCQkgKi8KPiA+ID4g
ICAJCWRhdGEgPSBwYWdlX2FkZHJlc3MoeGRwX3BhZ2UpICsgb2Zmc2V0Owo+ID4gPiAtCQl4ZHAu
ZGF0YV9oYXJkX3N0YXJ0ID0gZGF0YSAtIFZJUlRJT19YRFBfSEVBRFJPT00gKyB2aS0+aGRyX2xl
bjsKPiA+ID4gKwkJeGRwLmRhdGFfaGFyZF9zdGFydCA9IGRhdGEgLSBWSVJUSU9fWERQX0hFQURS
T09NOwo+ID4gPiAgIAkJeGRwLmRhdGEgPSBkYXRhICsgdmktPmhkcl9sZW47Cj4gPiA+ICAgCQl4
ZHAuZGF0YV9lbmQgPSB4ZHAuZGF0YSArIChsZW4gLSB2aS0+aGRyX2xlbik7Cj4gPiA+ICAgCQl4
ZHAuZGF0YV9tZXRhID0geGRwLmRhdGE7Cj4gPiA+IC0tIAo+ID4gPiAyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1h
aWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXph
dGlvbg==
