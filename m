Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6C61735B4
	for <lists.virtualization@lfdr.de>; Fri, 28 Feb 2020 11:58:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9DE8B880A1;
	Fri, 28 Feb 2020 10:58:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lu5D8sAQvRec; Fri, 28 Feb 2020 10:58:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2351888084;
	Fri, 28 Feb 2020 10:58:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F36D7C0177;
	Fri, 28 Feb 2020 10:58:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 960ACC0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 10:58:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 802F688084
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 10:58:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1sVK3psckPq5
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 10:58:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id AF1A288018
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 10:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582887515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FNzi12L8kMex8910yeIkxsSI0m8h0c3WmEc7STst+bY=;
 b=AuYiuG09pnn/Dui2RlrK6yo1+/5xcK2NSf7FZwshkW6b4+6CzALZDu406xN7lLo8tXMiBa
 PPm+/Nv+D+TEBUSxDd0icB0EkJjJylMUqCZG5mGn5HEKc3VbX1OxyuWu5Y8Zw/DJ3/W+Oh
 DBQAJEUEU+VMt+LSqXR0k2+PiOprSoc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-BWeI8Pc0N5WOHKz0Rg-nAQ-1; Fri, 28 Feb 2020 05:58:33 -0500
X-MC-Unique: BWeI8Pc0N5WOHKz0Rg-nAQ-1
Received: by mail-wm1-f71.google.com with SMTP id y18so1510322wmi.1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 02:58:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FNzi12L8kMex8910yeIkxsSI0m8h0c3WmEc7STst+bY=;
 b=mCQFgD5G+vGiLtGuxB36jCav7ln6Q09VLlIP6Miw0zoOK+jsO/RobblxVHcW7ui6RJ
 wuQzC3rPCVxJuvaNR9bjImEAf1BvpRxulQ+vHbKlO8lKI/BKOthNaDMtJXNANNt8ai6B
 n6nmfJSzFQvOoexoUhY7LWODqbiPo3w0XCvzSY40fnUqo0je1/1pNaovXyi+Y7vlQ486
 Ufpm3nm0KWNnr3RoC9u0U7kUnMDWJoQWJ63mle6jiDAXYgPSR+3FAdZy6ItvdtT0SfZZ
 +4NSTBf4IwNXGZG3gA4zEBw+/GRZbL2790l8ElwFtVDjJHYQ/C+ehpNq2oINiJaddzxg
 LKOA==
X-Gm-Message-State: APjAAAWauQuCuWkKepi7sbOn6awfwuNluC+CGxV3AmaUesn/5Y10FM1U
 fYCnJK/u2Wer7C75VfLPsNpFMF1n74IcgMMbwgD0uSP4gdCF1VBTFM8AFStRxXdM1nl1+FxHHrM
 1maBoXB3ei8WNsan+U4IFgKWMIeutXi5N4fsD3ABNaw==
X-Received: by 2002:a5d:69d1:: with SMTP id s17mr4315756wrw.339.1582887511999; 
 Fri, 28 Feb 2020 02:58:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqxKPJ+s8cjmUC9kLMqofOCQU6JmJoBuQ0o5NIbhumGPUuZGCRB0to2jvXVAehZJZ54zDSldag==
X-Received: by 2002:a5d:69d1:: with SMTP id s17mr4315737wrw.339.1582887511703; 
 Fri, 28 Feb 2020 02:58:31 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:d0d9:ea10:9775:f33f?
 ([2001:b07:6468:f312:d0d9:ea10:9775:f33f])
 by smtp.gmail.com with ESMTPSA id i10sm4945195wrn.53.2020.02.28.02.58.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Feb 2020 02:58:31 -0800 (PST)
Subject: Re: [virtio-dev] VIRTIO adoption in other hypervisors
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 virtio-dev@lists.oasis-open.org, virtualization@lists.linux-foundation.org
References: <87mu93vwy2.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <fca8366e-662f-af2f-382c-0216d9df63f8@redhat.com>
Date: Fri, 28 Feb 2020 11:58:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <87mu93vwy2.fsf@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: jan.kiszka@siemens.com, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <liuw@liuw.name>
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

T24gMjgvMDIvMjAgMTE6MTYsIEFsZXggQmVubsOpZSB3cm90ZToKPiAgIC0gSG93IGFib3V0IEh5
cGVyViBhbmQgdGhlIE9TWCBlcXVpdmFsZW50PwoKT1MgWCBIeXBlcnZpc29yLmZyYW1ld29yayBq
dXN0IHVzZXMgUUVNVSwgc28gaXQgY2FuIHVzZSB2aXJ0aW8gZGV2aWNlcwp0b28uICBWaXJ0dWFs
Qm94IGFsc28gc3VwcG9ydHMgdmlydGlvIGRldmljZXMuCgpQYW9sbwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBs
aXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlz
dHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
