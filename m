Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id E36364D15B3
	for <lists.virtualization@lfdr.de>; Tue,  8 Mar 2022 12:07:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5438482A3B;
	Tue,  8 Mar 2022 11:07:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Ic85VAO8ZqM; Tue,  8 Mar 2022 11:07:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0E8DF82A26;
	Tue,  8 Mar 2022 11:07:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 859B1C0073;
	Tue,  8 Mar 2022 11:07:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AD05BC000B
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Mar 2022 11:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8CC5A60B66
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Mar 2022 11:07:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z9r43Mjlh9OX
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Mar 2022 11:07:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A94B6058C
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Mar 2022 11:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646737656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+pn0Gp2y98eJDXuA8y7deIirBU9DlxAAqoNDwwNiF2I=;
 b=BofgWg739FA3w1PFUHvPh+MMaUgOzhFWM4COcbwa0roS3dPkm3SEVJs5om695VCj7edgm7
 YKXvGmrRen07/Wi/70B2rezYJkul4Gm35v/6tNGozfRC7rh6peO0nRa1nLbXvBS3MDrBtt
 VXDCXXrQwZ3pFhOCbFi1HMA0PF7HW3Y=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-8z0Zenh6PkW0TACuG96UHw-1; Tue, 08 Mar 2022 06:07:32 -0500
X-MC-Unique: 8z0Zenh6PkW0TACuG96UHw-1
Received: by mail-ed1-f70.google.com with SMTP id
 l14-20020aa7cace000000b003f7f8e1cbbdso10363888edt.20
 for <virtualization@lists.linux-foundation.org>;
 Tue, 08 Mar 2022 03:07:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=+pn0Gp2y98eJDXuA8y7deIirBU9DlxAAqoNDwwNiF2I=;
 b=jaqD55HsT2RaV74S5tXX4aTRZq9lkr804+36fDl7JzSkE3qPq05+VR7Q2DPb435HR7
 8aWd8sOrXdW2dNbTho18OMeHgyUC0X5vWCYQn58lJJgpksxp6/NKXJP784Irg9FqFhx7
 Oyl6qEpmeN4BcVV6TYRxoipc9F8ZpGK0amtVfZRyeisKeZ8T9TL2I7Tsgypc6eV3Evvv
 jo99BmZfQkcSL7wQJAVFLnw5Ju2hh+5Vyxv4R4jeUBXRH06QRMj85LaxSb+1KPLXKLV7
 lMyu27LEhKjYiFY2MktK0xEQ64jtioCMcd65lsXMxpQZbYxNND60T3QUPHyqe4Shpzy7
 Mixw==
X-Gm-Message-State: AOAM533xDh7/C3L3BUuCKrmxJYLb6469hNrR/Lg7di3ydddQ+92WfmGn
 3VJ5YUT+zXDEN8s44yifrAK4XxO8MnySJXRNBXcSQHCYkSpMbxo9o3pGuoqfG3f7MOqO//9mLXn
 6ETUD9M7i2D6NYRQqe3CggGSqk0qhl1xvkCCxzrTXpw==
X-Received: by 2002:a17:907:6d1d:b0:6d8:9fc8:b1e1 with SMTP id
 sa29-20020a1709076d1d00b006d89fc8b1e1mr12410553ejc.466.1646737650941; 
 Tue, 08 Mar 2022 03:07:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxesTWxnr9yva5EqLXO5ZOYMLukOGg2mvmb/yiXq/BaIek5yrIlr+WBV842eb0PxoGVnYMIYQ==
X-Received: by 2002:a17:907:6d1d:b0:6d8:9fc8:b1e1 with SMTP id
 sa29-20020a1709076d1d00b006d89fc8b1e1mr12410534ejc.466.1646737650745; 
 Tue, 08 Mar 2022 03:07:30 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 e12-20020a056402190c00b0041615cd434csm5336300edz.60.2022.03.08.03.07.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 03:07:30 -0800 (PST)
Date: Tue, 8 Mar 2022 06:07:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/1] vhost: Protect the virtqueue from being cleared
 whilst still in use
Message-ID: <20220308060705-mutt-send-email-mst@kernel.org>
References: <20220307191757.3177139-1-lee.jones@linaro.org>
 <20220307173439-mutt-send-email-mst@kernel.org>
 <YicNXOlH8al/Rlk3@google.com>
MIME-Version: 1.0
In-Reply-To: <YicNXOlH8al/Rlk3@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: syzbot+adc3cb32385586bec859@syzkaller.appspotmail.com, kvm@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
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

T24gVHVlLCBNYXIgMDgsIDIwMjIgYXQgMDg6MDE6MzJBTSArMDAwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+IE9uIE1vbiwgMDcgTWFyIDIwMjIsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiAKPiA+
IE9uIE1vbiwgTWFyIDA3LCAyMDIyIGF0IDA3OjE3OjU3UE0gKzAwMDAsIExlZSBKb25lcyB3cm90
ZToKPiA+ID4gdmhvc3RfdnNvY2tfaGFuZGxlX3R4X2tpY2soKSBhbHJlYWR5IGhvbGRzIHRoZSBt
dXRleCBkdXJpbmcgaXRzIGNhbGwKPiA+ID4gdG8gdmhvc3RfZ2V0X3ZxX2Rlc2MoKS4gIEFsbCB3
ZSBoYXZlIHRvIGRvIGhlcmUgaXMgdGFrZSB0aGUgc2FtZSBsb2NrCj4gPiA+IGR1cmluZyB2aXJ0
cXVldWUgY2xlYW4tdXAgYW5kIHdlIG1pdGlnYXRlIHRoZSByZXBvcnRlZCBpc3N1ZXMuCj4gPiAK
PiA+IFBscyBqdXN0IGJhc2ljYWxseSBjb3B5IHRoZSBjb2RlIGNvbW1lbnQgaGVyZS4gdGhpcyBp
cyBqdXN0IGNvbmZ1c2VzLgo+ID4gCj4gPiA+IEFsc28gV0FSTigpIGFzIGEgcHJlY2F1dGlvbmFy
eSBtZWFzdXJlLiAgVGhlIHB1cnBvc2Ugb2YgdGhpcyBpcyB0bwo+ID4gPiBjYXB0dXJlIHBvc3Np
YmxlIGZ1dHVyZSByYWNlIGNvbmRpdGlvbnMgd2hpY2ggbWF5IHBvcCB1cCBvdmVyIHRpbWUuCj4g
PiA+IAo+ID4gPiBMaW5rOiBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS9idWc/ZXh0aWQ9
Mjc5NDMyZDMwZDgyNWU2M2JhMDAKPiA+IAo+ID4gQW5kIHRoaXMgaXMgYSBidWcgd2UgYWxyZWFk
eSBmaXhlZCwgcmlnaHQ/Cj4gCj4gV2VsbCwgdGhpcyB3YXMgdGhlIGJ1ZyBJIHNldCBvdXQgdG8g
Zml4Lgo+IAo+IEkgZGlkbid0IGtub3cgeW91ciBwYXRjaCB3YXMgaW4gZmxpZ2h0IGF0IHRoZSB0
aW1lLgo+IAo+ID4gPiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+Cj4gPiA+IFJlcG9ydGVk
LWJ5OiBzeXpib3QrYWRjM2NiMzIzODU1ODZiZWM4NTlAc3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNv
bQo+ID4gCj4gPiBub3QgcmVhbGx5IGFwcGxpY2FibGUgYW55bW9yZSAuLi4KPiAKPiBJIGNhbiBy
ZW1vdmUgdGhlc2UgaWYgaXQgaGVscHMuCgp5ZXMgbGV0J3MgZG8gdGhhdCBwbHMuCgo+IC0tIAo+
IExlZSBKb25lcyBb5p2O55C85pavXQo+IFByaW5jaXBhbCBUZWNobmljYWwgTGVhZCAtIERldmVs
b3BlciBTZXJ2aWNlcwo+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBB
cm0gU29Dcwo+IEZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9u
IG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpo
dHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFs
aXphdGlvbg==
