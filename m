Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF271EE24C
	for <lists.virtualization@lfdr.de>; Thu,  4 Jun 2020 12:17:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1F9A788179;
	Thu,  4 Jun 2020 10:17:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8xATBfMzDnHq; Thu,  4 Jun 2020 10:17:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 94F5E8819D;
	Thu,  4 Jun 2020 10:17:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5E0EDC016E;
	Thu,  4 Jun 2020 10:17:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CA1E2C016E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 10:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B898C86F0B
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 10:17:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7eKGvkMe0w_z
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 10:17:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DDF4086F02
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 10:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591265864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2AztqKvzgy7aFiXghmWU8gdfGqSDj8pW4Rz5e+UFG6I=;
 b=A4n2Jf46Zsy2Kx+5jQYeros9vqolUzsEDygsutv7nxSBrXD0TdCaGHo7mt4m8AvDQ7xjVv
 V44o83uiEi87qGoN+jJfUfFmBZQ2iZwkAubp3lkjRyr7FHrwj+vsNXf8kGWzedG7kzvVRp
 lQ4VjWUHzXIqIGIydMKPAjRZ7iEUPKM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-QbBmo2K2Or6cTLPJUTeoNg-1; Thu, 04 Jun 2020 06:17:38 -0400
X-MC-Unique: QbBmo2K2Or6cTLPJUTeoNg-1
Received: by mail-wr1-f70.google.com with SMTP id l1so2222832wrc.8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 04 Jun 2020 03:17:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=2AztqKvzgy7aFiXghmWU8gdfGqSDj8pW4Rz5e+UFG6I=;
 b=DVIebpRl5lY3/beuyVsQeVzOzJJyEf2YXqaM9lj8V3JdeZjr8JhE3GGXsdAny674SL
 dvj27WAbWa4/CQFXMVNe52QI7Y0EHe1rseO0sSVQEp76V648AZge58biFQT5al6hmJxo
 9Snx2y3zm61u8iOdiAt11tIvzzoaGPbw+woC40J99XH+HKopdgj+DdKHj7gWSHT5f+qN
 gZc1/MgBzhqv3SGZWzHiQgg7EstRG4vB2f1J/6bdjigfPbJrQtVyLnulsleDuhawgb0a
 Zf/H4OVuE8/8p8l+G/HSFyjsakTD3kLnnLlH4gmXqxrSUaX60mWpAI39Ss0RFKXQl1Jd
 8fQQ==
X-Gm-Message-State: AOAM530c7Ut5Gh/E38RgHL14UFnpPdBpve+/9xWxvUnI088VMckTU3D2
 u9rZo50SpvCyIcJgg8BdVRiL7YHc/VLauIoDPUoTUiaKpwK7cVDBDhmxcsIDPMBbr/Vzg2ICdTb
 n4+h42ro7yyT5Kl5K0VkijZYKxfM/bwk+H41TlQTR0Q==
X-Received: by 2002:a1c:a3c1:: with SMTP id m184mr3568700wme.91.1591265857891; 
 Thu, 04 Jun 2020 03:17:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJO213xAQF9M1ot7ZZba5ozFLdbD1Lq18fiEmWZFnyrw/++lJWGikXa82it32Q87Xgmp4QWw==
X-Received: by 2002:a1c:a3c1:: with SMTP id m184mr3568671wme.91.1591265857625; 
 Thu, 04 Jun 2020 03:17:37 -0700 (PDT)
Received: from redhat.com ([2a00:a040:185:f65:9a3b:8fff:fed3:ad8d])
 by smtp.gmail.com with ESMTPSA id s8sm7754324wrg.50.2020.06.04.03.17.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2020 03:17:37 -0700 (PDT)
Date: Thu, 4 Jun 2020 06:17:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH RFC 07/13] vhost: format-independent API for used buffers
Message-ID: <20200604060732-mutt-send-email-mst@kernel.org>
References: <20200602130543.578420-1-mst@redhat.com>
 <20200602130543.578420-8-mst@redhat.com>
 <6d98f2cc-2084-cde0-c938-4ca01692adf9@redhat.com>
 <20200604050135-mutt-send-email-mst@kernel.org>
 <b39e6fb8-a59a-2b3f-a1eb-1ccea2fe1b86@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b39e6fb8-a59a-2b3f-a1eb-1ccea2fe1b86@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
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

T24gVGh1LCBKdW4gMDQsIDIwMjAgYXQgMDU6MTg6MDBQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzYvNCDkuIvljYg1OjAzLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6
Cj4gPiA+ID4gICAgc3RhdGljIGJvb2wgdmhvc3Rfbm90aWZ5KHN0cnVjdCB2aG9zdF9kZXYgKmRl
diwgc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAqdnEpCj4gPiA+ID4gICAgewo+ID4gPiA+ICAgIAlf
X3UxNiBvbGQsIG5ldzsKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aG9zdC92aG9zdC5o
IGIvZHJpdmVycy92aG9zdC92aG9zdC5oCj4gPiA+ID4gaW5kZXggYTY3YmRhOTc5MmVjLi42YzEw
ZTk5ZmYzMzQgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy92aG9zdC92aG9zdC5oCj4gPiA+
ID4gKysrIGIvZHJpdmVycy92aG9zdC92aG9zdC5oCj4gPiA+ID4gQEAgLTY3LDYgKzY3LDEzIEBA
IHN0cnVjdCB2aG9zdF9kZXNjIHsKPiA+ID4gPiAgICAJdTE2IGlkOwo+ID4gPiA+ICAgIH07Cj4g
PiA+ID4gK3N0cnVjdCB2aG9zdF9idWYgewo+ID4gPiA+ICsJdTMyIG91dF9sZW47Cj4gPiA+ID4g
Kwl1MzIgaW5fbGVuOwo+ID4gPiA+ICsJdTE2IGRlc2NzOwo+ID4gPiA+ICsJdTE2IGlkOwo+ID4g
PiA+ICt9Owo+ID4gPiBTbyBpdCBsb29rcyB0byBtZSB0aGUgc3RydWN0IHZob3N0X2J1ZiBjYW4g
d29yayBmb3IgYm90aCBzcGxpdCByaW5nIGFuZAo+ID4gPiBwYWNrZWQgcmluZy4KPiA+ID4gCj4g
PiA+IElmIHRoaXMgaXMgdHJ1ZSwgd2UnZCBiZXR0ZXIgbWFrZSBzdHJ1Y3Qgdmhvc3RfZGVzYyB3
b3JrIGZvciBib3RoLgo+ID4gPiAKPiA+ID4gVGhhbmtzCj4gPiBCb3RoIHZob3N0X2Rlc2MgYW5k
IHZob3N0X2J1ZiBjYW4gd29yayBmb3Igc3BsaXQgYW5kIHBhY2tlZC4KPiA+IAo+ID4gRG8geW91
IG1lYW4gd2Ugc2hvdWxkIGFkZCBwYWNrZWQgcmluZyBzdXBwb3J0IGJhc2VkIG9uIHRoaXM/Cj4g
PiBGb3Igc3VyZSwgdGhpcyBpcyBvbmUgb2YgdGhlIG1vdGl2YXRvcnMgZm9yIHRoZSBwYXRjaHNl
dC4KPiA+IAo+IAo+IFNvbWVob3cuIEJ1dCB0aGUgcmVhc29uIEkgYXNrIGlzIHRoYXQgSSBzZWUg
InNwbGl0IiBzdWZmaXggaXMgdXNlZCBpbiBwYXRjaAo+IDEgYXM6Cj4gCj4gcGVla19zcGxpdF9k
ZXNjKCkKPiBwb3Bfc3BsaXRfZGVzYygpCj4gcHVzaF9zcGxpdF9kZXNjKCkKPiAKPiBCdXQgdGhh
dCBzdWZmaXggaXMgbm90IHVzZWQgZm9yIHRoZSBuZXcgdXNlZCByaW5nIEFQSSBpbnZlbnRlZCBp
biB0aGlzCj4gcGF0Y2guCj4gCj4gVGhhbmtzCj4gCgpBbmQgdGhhdCBpcyBpbnRlbnRpb25hbDog
c3BsaXQgaXMgKm5vdCogcGFydCBvZiBBUEkuIFRoZSB3aG9sZSBpZGVhIGlzCnRoYXQgcmluZyBB
UElzIGFyZSBmb3JtYXQgYWdub3N0aWMgdXNpbmcgImJ1ZmZlciIgdGVybWlub2xvZ3kgZnJvbSBz
cGVjLgpUaGUgc3BsaXQgdGhpbmdzIGFyZSBhbGwgc3RhdGljIHdpdGhpbiB2aG9zdC5jCgpPSyBz
byB3aGVyZSBJIGhhZCB0byBhZGQgYSBidW5jaCBvZiBuZXcgZm9ybWF0IHNwZWNpZmljIGNvZGUs
IHRoYXQgd2FzCnRhZ2dlZCBhcyAic3BsaXQiIHRvIG1ha2UgaXQgZWFzaWVyIHRvIHNwb3QgdGhh
dCB0aGV5IG9ubHkgc3VwcG9ydCBhCnNwZWNpZmljIGZvcm1hdC4gIEF0IHRoZSBzYW1lIHRpbWUs
IEkgZGlkIG5vdCByZW5hbWUgZXhpc3RpbmcgY29kZQphZGRpbmcgInNwbGl0IiBpbiB0aGUgbmFt
ZS4gSSBhZ3JlZSBpdCdzIGEgdXNlZnVsIGFkZGl0aW9uYWwgc3RlcCBmb3IKcGFja2VkIHJpbmcg
Zm9ybWF0IHN1cHBvcnQsIGFuZCBpdCdzIGZhaXJseSBlYXN5LiBJIGp1c3QgZGlkbid0IHdhbnQK
dG8gZG8gaXQgYXV0b21hdGljYWxseS4KCgoKLS0gCk1TVAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZp
cnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGlu
dXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
