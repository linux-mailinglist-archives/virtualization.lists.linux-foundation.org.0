Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id AC18C1EE06C
	for <lists.virtualization@lfdr.de>; Thu,  4 Jun 2020 11:01:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4BF33881AD;
	Thu,  4 Jun 2020 09:01:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zSlwaWkXdPDM; Thu,  4 Jun 2020 09:01:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 863BA8819B;
	Thu,  4 Jun 2020 09:01:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 657F0C016E;
	Thu,  4 Jun 2020 09:01:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 77AE1C016E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 09:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 66A6A86EFE
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 09:01:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DbJNjQgJVsXf
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 09:01:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D6AB68689B
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 09:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591261285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xh5Mj8Dm7pwISvlFLqL8NiYNfeUBsG7hGmY7DgnArSI=;
 b=HuRC8VZ2Huz0BGAt1+rcEiJIVNsKFUunWLnXhJXb01O0BPWZmANaRxaw1kjIJWp3Lm+X/v
 gajLV6Q489tY4hapfTqoUksl1BZljlG/+SvoXSAmFn4DtDIAUBC2ukoIio9M16vjdOD0Ku
 SDQuEUltmN3yOYYOm5ess7yO41mw9cI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-WzmGtEeFPwiqKPpk-dTZTg-1; Thu, 04 Jun 2020 05:01:20 -0400
X-MC-Unique: WzmGtEeFPwiqKPpk-dTZTg-1
Received: by mail-wr1-f70.google.com with SMTP id f4so2142608wrp.21
 for <virtualization@lists.linux-foundation.org>;
 Thu, 04 Jun 2020 02:01:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=xh5Mj8Dm7pwISvlFLqL8NiYNfeUBsG7hGmY7DgnArSI=;
 b=jK+84gOv27iYHkkQN+zEeCg8jLoTQkKoqluezVNgRRl9mqNTQqd5O4eG8iE8z1fn7S
 +0WHAvPjxnC9XNzT6hInLivTrgbeGfyQApExdV3+Bvj/y85ijgLwt7AUVI6iJt2qyp9T
 kKMgFWczekYlW8ZCVeC+EGzKrkP0DMMaLwZlgRIhtM6O43V0I6U//uCKZRFE5OnSDA8t
 xQkHyHtxYOpFrjNJ+y3O07nM7K/fLl/WLwmqNJ9jK1EPdFZd86HiwuVX/syNb6iFoLvW
 JsfKbbjZBtP6ltzJG1E0hIeSt6MgAvaTKEqUSbTcuTgqSbD7qle1KhZx5PQRsVXO8C2I
 Lp5A==
X-Gm-Message-State: AOAM532cdU3E3utVikrVjQDPKc7NR1iAYnGT9iHelX45i3mFuc4z0SKs
 C9Ib1NfBP8sIe0+BNBLMCWVTLFDQqIpgjPpZHoQddMLfVgRuqL8xUDyA4b78LD/uL2/lOz5MgWN
 xFMpSG3axoBgyEZruD/+wGVN2OG4h3cr+Va2Y1W0JXA==
X-Received: by 2002:adf:ea03:: with SMTP id q3mr3291686wrm.286.1591261279686; 
 Thu, 04 Jun 2020 02:01:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/zGaMBjx21Z9cwBMj+pCZMs7uKzsNY9xUq1Big6tLAZfVUSVRfMUci1KnmD6zuRYgAJmYOQ==
X-Received: by 2002:adf:ea03:: with SMTP id q3mr3291669wrm.286.1591261279537; 
 Thu, 04 Jun 2020 02:01:19 -0700 (PDT)
Received: from redhat.com ([2a00:a040:185:f65:9a3b:8fff:fed3:ad8d])
 by smtp.gmail.com with ESMTPSA id d18sm6904921wrn.34.2020.06.04.02.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2020 02:01:18 -0700 (PDT)
Date: Thu, 4 Jun 2020 05:01:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH RFC 04/13] vhost: cleanup fetch_buf return code handling
Message-ID: <20200604050011-mutt-send-email-mst@kernel.org>
References: <20200602130543.578420-1-mst@redhat.com>
 <20200602130543.578420-5-mst@redhat.com>
 <7221afa5-bafd-f19b-9cfd-cc51a8d3b321@redhat.com>
MIME-Version: 1.0
In-Reply-To: <7221afa5-bafd-f19b-9cfd-cc51a8d3b321@redhat.com>
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

T24gV2VkLCBKdW4gMDMsIDIwMjAgYXQgMDM6Mjk6MDJQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzYvMiDkuIvljYg5OjA2LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6
Cj4gPiBSZXR1cm4gY29kZSBvZiBmZXRjaF9idWYgaXMgY29uZnVzaW5nLCBzbyBjYWxsZXJzIHJl
c29ydCB0bwo+ID4gdHJpY2tzIHRvIGdldCB0byBzYW5lIHZhbHVlcy4gTGV0J3Mgc3dpdGNoIHRv
IHNvbWV0aGluZyBzdGFuZGFyZDoKPiA+IDAgZW1wdHksID4wIG5vbi1lbXB0eSwgPDAgZXJyb3Iu
Cj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgUy4gVHNpcmtpbjxtc3RAcmVkaGF0LmNv
bT4KPiA+IC0tLQo+ID4gICBkcml2ZXJzL3Zob3N0L3Zob3N0LmMgfCAyNCArKysrKysrKysrKysr
KysrLS0tLS0tLS0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDggZGVs
ZXRpb25zKC0pCj4gCj4gCj4gV2h5IG5vdCBzcXVhc2hpbmcgdGhpcyBpbnRvIHBhdGNoIDIgb3Ig
Mz8KPiAKPiBUaGFua3MKCkl0IG1ha2VzIHRoZSB0cmlja3kgcGF0Y2hlcyBzbWFsbGVyLiBJJ2xs
IGNvbnNpZGVyIGl0LApmb3Igbm93IHRoaXMgc3BsaXQgaXMgYWxzbyBiZWNhdXNlIHBhdGNoZXMg
MS0zIGhhdmUKYWxyZWFkeSBiZWVuIHRlc3RlZC4KCi0tIApNU1QKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlz
dApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3Rz
LmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
