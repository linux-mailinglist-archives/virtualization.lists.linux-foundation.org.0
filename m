Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7421659E5
	for <lists.virtualization@lfdr.de>; Thu, 20 Feb 2020 10:09:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A1F7983702;
	Thu, 20 Feb 2020 09:09:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n95nX-cud8ge; Thu, 20 Feb 2020 09:09:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 73B3583EFE;
	Thu, 20 Feb 2020 09:09:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 58ABFC013E;
	Thu, 20 Feb 2020 09:09:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 53D08C013E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 09:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 422202046F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 09:09:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rS89GT0cx7Cc
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 09:09:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 690AD203F8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 09:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582189765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qQ79QeeS4OSAwiHkPXsm3UglLPYPJbtGAHmqpNU4+lQ=;
 b=A1SA8KCRYT1ppd+3E8f6b0TF5ZyJJmW2+zbvkYDgwwTrCoxOSOpeSMLnlPHxHrhUT+CzfN
 xu/H4oZIEMGqQCNT3KOLUuDoEL+tMrcdEakAik+lZhQRgpVh050xk3u+4Nc1y1yNu0YKar
 03ZnQVU0+y0Q65J0ss+TS0PGGnd9ocI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-bQMGX9eWMXiQy407bUsTvg-1; Thu, 20 Feb 2020 04:09:23 -0500
Received: by mail-wr1-f71.google.com with SMTP id s13so1445835wrb.21
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 01:09:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=KN7rEECvZEXdU6a12wfZOhPFPAnfs6WWVcWaa4l8tB8=;
 b=Da2LgfZ6BttCf5e0Pn5RQhbSDvbcPB53kh4a5+UirvUdt5BLyp9hGunjYjwaCvWj/m
 elK//bI0+wbHDr5FYi2PE2EMnmr1ShIoZikuQZxu4J3qYQYGjEh00Yww8OgKoXt9RDTm
 iEbz/7Gvf4LqJ4Exod5T+ftBu8CiPx0eDEDep67DMsr95Up+WvHDYhQViRieTW/8xIY/
 IKy/j5o/ucWkk+8oJ2jRfWjR1VygC2H6aH3eZQ/6i4hhaUOgrm+w1DNuc1RQE7ffeW12
 JrUt/NBoeQJ0rUiFCkZJNX1SWPRYlDZsat4X5CIBRSaC6ZxCKui/QdUNDkQH/JFFgwSA
 ii/g==
X-Gm-Message-State: APjAAAUvuhrGHakBTqljhM5y7vRMxcZEh+Cx1qkv3JcrpW+EqnJc9VrV
 ena87UkCnL7iLbyjJ79N3uvRRn4DCw7xtB1HSrQWodEtk/Ak/K+skXWG5fE1UXLSxJyy2bwPR9k
 JELYj35Pofkr97j8y9Kp2uq255K7lbmcvWAhfagIQnw==
X-Received: by 2002:a1c:2089:: with SMTP id g131mr3043324wmg.63.1582189762246; 
 Thu, 20 Feb 2020 01:09:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqxuP2UdYyi73MjeE3vnzzNZI01MnvzA+dn9FFZ8I7LwiSQkzQOBin8Kub8QMd4N8L20So6CHQ==
X-Received: by 2002:a1c:2089:: with SMTP id g131mr3043309wmg.63.1582189762074; 
 Thu, 20 Feb 2020 01:09:22 -0800 (PST)
Received: from [131.159.204.89] (w204-2h-v4.eduroam.dynamic.rbg.tum.de.
 [131.159.204.89])
 by smtp.gmail.com with ESMTPSA id m21sm3580891wmi.27.2020.02.20.01.09.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2020 01:09:21 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] virtio_balloon: Fix build error seen with
 CONFIG_BALLOON_COMPACTION=n
Date: Thu, 20 Feb 2020 10:09:20 +0100
Message-Id: <48277641-3748-4EFD-BB19-ED5C9E06FDF2@redhat.com>
References: <20200220023156.20636-1-linux@roeck-us.net>
In-Reply-To: <20200220023156.20636-1-linux@roeck-us.net>
To: Guenter Roeck <linux@roeck-us.net>
X-Mailer: iPhone Mail (17D50)
X-MC-Unique: bQMGX9eWMXiQy407bUsTvg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>
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

Cgo+IEFtIDIwLjAyLjIwMjAgdW0gMDM6MzIgc2NocmllYiBHdWVudGVyIFJvZWNrIDxsaW51eEBy
b2Vjay11cy5uZXQ+Ogo+IAo+IO+7vzBkYXkgcmVwb3J0czoKPiAKPiBkcml2ZXJzLy92aXJ0aW8v
dmlydGlvX2JhbGxvb24uYzogSW4gZnVuY3Rpb24gJ3ZpcnRiYWxsb29uX3Byb2JlJzoKPiBkcml2
ZXJzLy92aXJ0aW8vdmlydGlvX2JhbGxvb24uYzo5NjA6MTogZXJyb3I6Cj4gICAgbGFiZWwgJ291
dF9kZWxfdnFzJyBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVdlcnJvcj11bnVzZWQtbGFiZWxdCj4g
Cj4gVGhpcyBpcyBzZWVuIHdpdGggQ09ORklHX0JBTExPT05fQ09NUEFDVElPTj1uLgo+IAo+IFJl
cG9ydGVkLWJ5OiBrYnVpbGQgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPiBGaXhlczogMWFk
NmY1OGVhOTM2ICgidmlydGlvX2JhbGxvb246IEZpeCBtZW1vcnkgbGVha3Mgb24gZXJyb3JzIGlu
IHZpcnRiYWxsb29uX3Byb2JlKCkiKQo+IENjOiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVk
aGF0LmNvbT4KPiBDYzogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+Cj4gLS0tCgpUaGVy
ZSBpcyBhbHJlYWR5IGEgcGF0Y2ggb24gdGhlIGxpc3QgdG8gZml4IHRoYXQgKGFuZCBpdCBsb29r
cyBleGFjdGx5IGxpa2UgdGhpcyBvbmUgOikgKS4gVW5mb3J0dW5hdGVseSwgbm90IHBpY2tlZCB1
cCB5ZXQuCgpUaGFua3MhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMu
bGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21h
aWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
