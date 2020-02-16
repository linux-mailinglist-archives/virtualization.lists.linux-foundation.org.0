Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B52C3160261
	for <lists.virtualization@lfdr.de>; Sun, 16 Feb 2020 08:47:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 726E8860B2;
	Sun, 16 Feb 2020 07:47:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gwkoQy4xTgqZ; Sun, 16 Feb 2020 07:47:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2138D863E1;
	Sun, 16 Feb 2020 07:47:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E9661C0177;
	Sun, 16 Feb 2020 07:47:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DD4FDC0177
 for <virtualization@lists.linux-foundation.org>;
 Sun, 16 Feb 2020 07:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6610487532
 for <virtualization@lists.linux-foundation.org>;
 Sun, 16 Feb 2020 07:47:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pDekh3yLARDa
 for <virtualization@lists.linux-foundation.org>;
 Sun, 16 Feb 2020 07:47:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D489786C6D
 for <virtualization@lists.linux-foundation.org>;
 Sun, 16 Feb 2020 07:47:38 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id 59so13177060otp.12
 for <virtualization@lists.linux-foundation.org>;
 Sat, 15 Feb 2020 23:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=t9s1T3eocQw5dgvxMojafgwpl5YoO6h8bjzIOUjQhy0=;
 b=nSbdy3samj8+Q2RYYBRWCqRbVnOhlmAZZ6uKOE0piU2F+J+fZInogaPDpv/bPEP+Rx
 enpcDPGp34/pDt/gCIMaw93qHfUVwMpyzZWK9IxerKmxbX3BpgJHTlZgIz8YyXgqxyEP
 MBy3BsVXjttnDwZut+ioMf5cii/6mPZmC4SXZt1me+crv+QLKExXgeBX0U/kqSeH9uwI
 Tb9HkLHr4WWlqCY3aoVDj3jN8Mt6jtr69MVVRLg4BY8L3N/Ri1CCo7uQ/Ut8k2gWsmQZ
 TROVQpamxHgNd0NrAPlnSA0p7kgk4I0i0vhQUWVws42L/JKqlUpKo11dNGcMjfrZs7R4
 v3bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=t9s1T3eocQw5dgvxMojafgwpl5YoO6h8bjzIOUjQhy0=;
 b=B0o16sLTtVOq+SVKbhkgwlCt8VisgHiD7kMmNVeWaKPnQlFUWwrmZ2wE3+BjBnWeY3
 bMj64bhPU9o2NW9zmIn0noCFhjb6VNNsRGPu1Tvx+CkqPvEFyCFGUz+tBPkiwJZuCtTT
 kezEyoG99/4E1YswTIHEW5HI/uwaAlS6oA3R+eDMEamt223Teopy9w3yW4g8YrvYT3PU
 8XicwArki9NWtjOYk5apw2SCmFv3/B0uEM8TBUE8hyDgSOpqTNfiQcPtiNc4IcNTqs1v
 kOG2yIlzr5kL7cUfCopOv0BeR0tbFnNmju3DMl6/QbfwA8oNxj2QkTTMJHNu12Q6Fd82
 AxCg==
X-Gm-Message-State: APjAAAXdjwn9InRXpIvRv/UX2ILbEzCiPJ+mJLPAty/rEifu7jl/kjpf
 Uxs+EEVDV3uVDRKbHdBDXOyJgNCC
X-Google-Smtp-Source: APXvYqyGXk/eH31o+eRMhSWi4j55/TFMgC4INohI2TEWVKX6QqF4IaWaliKAoNttXJo4HRL6zUsCfg==
X-Received: by 2002:a9d:6d1a:: with SMTP id o26mr7860793otp.141.1581839257856; 
 Sat, 15 Feb 2020 23:47:37 -0800 (PST)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id p184sm3601382oic.40.2020.02.15.23.47.37
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 15 Feb 2020 23:47:37 -0800 (PST)
Date: Sun, 16 Feb 2020 00:47:35 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH] virtio_balloon: Adjust label in virtballoon_probe
Message-ID: <20200216074735.GA4717@ubuntu-m2-xlarge-x86>
References: <20200216004039.23464-1-natechancellor@gmail.com>
 <67FCAE69-05CF-4588-A7BC-664267D14BAF@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <67FCAE69-05CF-4588-A7BC-664267D14BAF@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: clang-built-linux@googlegroups.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>
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

T24gU3VuLCBGZWIgMTYsIDIwMjAgYXQgMDg6MzY6NDVBTSArMDEwMCwgRGF2aWQgSGlsZGVuYnJh
bmQgd3JvdGU6Cj4gCj4gCj4gPiBBbSAxNi4wMi4yMDIwIHVtIDAxOjQxIHNjaHJpZWIgTmF0aGFu
IENoYW5jZWxsb3IgPG5hdGVjaGFuY2VsbG9yQGdtYWlsLmNvbT46Cj4gPiAKPiA+IO+7v0NsYW5n
IHdhcm5zIHdoZW4gQ09ORklHX0JBTExPT05fQ09NUEFDVElPTiBpcyB1bnNldDoKPiA+IAo+ID4g
Li4vZHJpdmVycy92aXJ0aW8vdmlydGlvX2JhbGxvb24uYzo5NjM6MTogd2FybmluZzogdW51c2Vk
IGxhYmVsCj4gPiAnb3V0X2RlbF92cXMnIFstV3VudXNlZC1sYWJlbF0KPiA+IG91dF9kZWxfdnFz
Ogo+ID4gXn5+fn5+fn5+fn5+Cj4gPiAxIHdhcm5pbmcgZ2VuZXJhdGVkLgo+ID4gCj4gCj4gVGhh
bmtzLCB0aGVyZSBpcyBhbHJlYWR5IOKAniBbUEFUQ0hdIHZpcnRpb19iYWxsb29uOiBGaXggdW51
c2VkIGxhYmVsIHdhcm5pbmfigJwgZnJvbSBCb3JpcyBvbiB0aGUgbGlzdC4KPiAKPiBDaGVlcnMh
Cj4gCgpTb3JyeSBmb3IgdGhlIG5vaXNlLCBJIHRob3VnaHQgSSBkaWQgYSBzZWFyY2ggZm9yIGR1
cGxpY2F0ZSBwYXRjaGVzIGJ1dApzZWVtcyBJIG1pc3NlZCBpdCA6LyBJJ3ZlIGNvbW1lbnRlZCBv
biB0aGF0IHBhdGNoLgoKQ2hlZXJzLApOYXRoYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxp
emF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3Vu
ZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
