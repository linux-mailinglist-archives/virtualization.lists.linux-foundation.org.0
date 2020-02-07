Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 792921552C2
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 08:10:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 33D9987D11;
	Fri,  7 Feb 2020 07:10:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ue65-hSNHlOk; Fri,  7 Feb 2020 07:10:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A62F487C41;
	Fri,  7 Feb 2020 07:10:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 73798C013E;
	Fri,  7 Feb 2020 07:10:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BF738C013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 07:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A8E62203B5
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 07:10:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yOJ2-wn+RJe0
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 07:10:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id D07551FE32
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 07:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581059433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=96SMThz6L0UJNrqUeXD+zFhU/Yhbd2q8gE1aIuv5qyE=;
 b=Icftm7Wn2IiKaFmt4N5uKcejr+GcCPrZ0XUhBNb5gwhc99RTqfUeVg2FMXcNIXz8P5g2Rd
 V0QHYujeaTEMP9vXTIba9u/IeVbSkh4dDGjqOQphh7kfP2fxJGmq2poGyjqUrBJiVxWG8U
 e8oDFcmxBZaI/9+P0RwYOk7tWec/7WA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-AFAwpjIxNmCDPNlCv_seKQ-1; Fri, 07 Feb 2020 02:10:31 -0500
Received: by mail-qv1-f70.google.com with SMTP id ce2so592383qvb.23
 for <virtualization@lists.linux-foundation.org>;
 Thu, 06 Feb 2020 23:10:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=96SMThz6L0UJNrqUeXD+zFhU/Yhbd2q8gE1aIuv5qyE=;
 b=iM9LL63WISzZ3NZabuFisJ38UyA9AXxXMV17Zd0yt8mW/kSTozQRNPVaQperXl1TiU
 atGTc+Ndvt9DJXXaj6bYq02ztPOdEqumcBiuA2qJUGirQ0MgS4YSnQ2j8gAoYFg6v69+
 hNNdZ0bLvM+DQDC5IHzfb/htwchHxLfimDs898LnolUoUc4gyqb5kqL3VU3QnTSQuhNj
 PdbvCeL2TPf1NE5NbTZkE1MmDghZK1HPbBVZmKEQ66RYtWu0uhd5zgNLVnfdlX0GTto7
 yTQUljRtmN/BsKikLG+YVp7AM3w/TBZeyqDmYbi5/Sa5E3M3tqE11FySVSGm7uVYws5A
 0GFw==
X-Gm-Message-State: APjAAAX/9nNCOhDivkWnn7KnUw8lsL+jw0Fd5WucL1qeeAMupv35AhCf
 YqhuO5nl2yOzVV5O9HD/mZLplaJjfDOVSH5Y6gZowl98s7SXUUhvvnlnXyyug0aFMDAYu9kA7um
 0TIvO6yufEbZj4QmkAAX3g5KjJCNTS4tSxNomjZrpww==
X-Received: by 2002:ac8:758a:: with SMTP id s10mr6179209qtq.283.1581059431456; 
 Thu, 06 Feb 2020 23:10:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqxTt5L3VTuonP/9DSLhE6PiW2T051y0ELHfBhpQWVNPM2qU8HF0YoqTUyKVRZwj5KnuN8KJhw==
X-Received: by 2002:ac8:758a:: with SMTP id s10mr6179199qtq.283.1581059431238; 
 Thu, 06 Feb 2020 23:10:31 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
 by smtp.gmail.com with ESMTPSA id 136sm892346qkn.109.2020.02.06.23.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 23:10:30 -0800 (PST)
Date: Fri, 7 Feb 2020 02:10:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] tools/virtio: option to build an out of tree module
Message-ID: <20200207015917-mutt-send-email-mst@kernel.org>
References: <20200206080125.1178242-1-mst@redhat.com>
 <d4581772-8314-e746-dbea-2603e0447cdd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <d4581772-8314-e746-dbea-2603e0447cdd@redhat.com>
X-MC-Unique: AFAwpjIxNmCDPNlCv_seKQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

T24gRnJpLCBGZWIgMDcsIDIwMjAgYXQgMTE6Mzg6MjBBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzIvNiDkuIvljYg0OjAxLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6
Cj4gPiBIYW5keSBmb3IgdGVzdGluZyB3aXRoIGRpc3RybyBrZXJuZWxzLgo+ID4gV2FybiB0aGF0
IHRoZSByZXN1bHRpbmcgbW9kdWxlIGlzIGNvbXBsZXRlbHkgdW5zdXBwb3J0ZWQsCj4gPiBhbmQg
aXNuJ3QgaW50ZW5kZWQgZm9yIHByb2R1Y3Rpb24gdXNlLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5
OiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPgo+ID4gLS0tCj4gPiAgIHRvb2xz
L3ZpcnRpby9NYWtlZmlsZSB8IDEzICsrKysrKysrKysrKy0KPiA+ICAgMSBmaWxlIGNoYW5nZWQs
IDEyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL3Rv
b2xzL3ZpcnRpby9NYWtlZmlsZSBiL3Rvb2xzL3ZpcnRpby9NYWtlZmlsZQo+ID4gaW5kZXggOGUy
YTkwODExNWMyLi45NDEwNmNkZTQ5ZTMgMTAwNjQ0Cj4gPiAtLS0gYS90b29scy92aXJ0aW8vTWFr
ZWZpbGUKPiA+ICsrKyBiL3Rvb2xzL3ZpcnRpby9NYWtlZmlsZQo+ID4gQEAgLTgsNyArOCwxOCBA
QCBDRkxBR1MgKz0gLWcgLU8yIC1XZXJyb3IgLVdhbGwgLUkuIC1JLi4vaW5jbHVkZS8gLUkgLi4v
Li4vdXNyL2luY2x1ZGUvIC1Xbm8tcG9pbgo+ID4gICB2cGF0aCAlLmMgLi4vLi4vZHJpdmVycy92
aXJ0aW8gLi4vLi4vZHJpdmVycy92aG9zdAo+ID4gICBtb2Q6Cj4gPiAgIAkke01BS0V9IC1DIGBw
d2RgLy4uLy4uIE09YHB3ZGAvdmhvc3RfdGVzdCBWPSR7Vn0KPiA+IC0uUEhPTlk6IGFsbCB0ZXN0
IG1vZCBjbGVhbgo+ID4gKwo+ID4gKyNvb3Q6IGJ1aWxkIHZob3N0IGFzIGFuIG91dCBvZiB0cmVl
IG1vZHVsZSBmb3IgYSBkaXN0cm8ga2VybmVsCj4gPiArI25vIGVmZm9ydCBpcyB0YWtlbiB0byBt
YWtlIGl0IGFjdHVhbGx5IGJ1aWxkIG9yIHdvcmssIGJ1dCB0ZW5kcyB0byBtb3N0bHkgd29yawo+
ID4gKyNpZiB0aGUgZGlzdHJvIGtlcm5lbCBpcyB2ZXJ5IGNsb3NlIHRvIHVwc3RyZWFtCj4gPiAr
I3Vuc3VwcG9ydGVkISB0aGlzIGlzIGEgZGV2ZWxvcG1lbnQgdG9vbCBvbmx5LCBkb24ndCB1c2Ug
dGhlCj4gPiArI3Jlc3VsdGluZyBtb2R1bGVzIGluIHByb2R1Y3Rpb24hCj4gPiArb290Ogo+ID4g
KwllY2hvICJVTlNVUFBPUlRFRCEgRG9uJ3QgdXNlIHRoZSByZXN1bHRpbmcgbW9kdWxlcyBpbiBw
cm9kdWN0aW9uISIKPiA+ICsJS0NGTEFHUz0iLUkgImBwd2RgLy4uLy4uL2RyaXZlcnMvdmhvc3Qg
JHtNQUtFfSAtQyAvdXNyL3NyYy9rZXJuZWxzLyQkKHVuYW1lIC1yKSBNPWBwd2RgL3Zob3N0X3Rl
c3QgVj0ke1Z9Cj4gPiArCUtDRkxBR1M9Ii1JICJgcHdkYC8uLi8uLi9kcml2ZXJzL3Zob3N0ICR7
TUFLRX0gLUMgL3Vzci9zcmMva2VybmVscy8kJCh1bmFtZSAtcikgTT1gcHdkYC8uLi8uLi9kcml2
ZXJzL3Zob3N0IFY9JHtWfSBDT05GSUdfVkhPU1RfVlNPQ0s9bgo+IAo+IAo+IEFueSByZWFzb24g
Zm9yIGRpc2FibGluZyB2c29jayBoZXJlPwo+IAo+IFRoYW5rcwoKSXQncyBqdXN0IG1vdmluZyB0
b28gZmFzdCB3aXRoIGl0cyBpbnRlcm5hbCBBUEkgY2hhbmdlcyBmb3IgYSBzaW1wbGlzdGljCm9v
dCBidWlsZCBsaWtlIHRoaXMgdG8gd29yay4gQnV0IEkgZ3Vlc3MgaXQgbmVlZCB0byBtYWtlIGl0
IGEgYml0Cm1vcmUgZ2VuZXJpYy4gSSdsbCB0cnkuCgo+IAo+ID4gKwo+ID4gKy5QSE9OWTogYWxs
IHRlc3QgbW9kIGNsZWFuIHZob3N0IG9vdAo+ID4gICBjbGVhbjoKPiA+ICAgCSR7Uk19ICoubyB2
cmluZ2hfdGVzdCB2aXJ0aW9fdGVzdCB2aG9zdF90ZXN0LyoubyB2aG9zdF90ZXN0Ly4qLmNtZCBc
Cj4gPiAgICAgICAgICAgICAgICAgdmhvc3RfdGVzdC9Nb2R1bGUuc3ltdmVycyB2aG9zdF90ZXN0
L21vZHVsZXMub3JkZXIgKi5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlz
dHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3Jn
L21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
