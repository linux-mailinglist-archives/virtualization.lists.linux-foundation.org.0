Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2BE173519
	for <lists.virtualization@lfdr.de>; Fri, 28 Feb 2020 11:16:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 03309880F5;
	Fri, 28 Feb 2020 10:16:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L5gQ6t83N-Rd; Fri, 28 Feb 2020 10:16:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BA3F3880D9;
	Fri, 28 Feb 2020 10:16:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9FF96C0177;
	Fri, 28 Feb 2020 10:16:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A5DEC0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 10:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 30D2C20111
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 10:16:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6fmke9prdO7T
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 10:16:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by silver.osuosl.org (Postfix) with ESMTPS id EB66E20110
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 10:16:25 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id n64so1244571wme.3
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 02:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=user-agent:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ApxA+b7pDrjfkhS3lKuNK1yWfrbS8xyNaLvF1vqnxfs=;
 b=YrvyFwIsVujB7xf6XRs2D/i99qvrgc2jHZXLEQCpzdZIjP6Uj/bS8j5D+ResjCH3Q6
 50pNsWTCJ5uVDR85OG45K+815gFhxOq20U2g8wyRqVN2Pqt1LhPzrcXIi5gZcB2FHldA
 L7SE7prOpjv6m4m8Qd47KDGU61QvLFGhkOZcpcXNxou5yVWiRMSDPXTYFgmm8VFFDPYV
 N93V60ode0kqABn224YQ1iMy+oJKUcnFT9cEi1DFhnVB54P6T7AJ46pjF8s8h8AoQn80
 ZBbHn1g/VgN5khlnUbnM1yEDNwinSQo9cGeEuyol9WP53cxuXaIWhI3uLDYo3ttKzBSJ
 AA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:user-agent:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ApxA+b7pDrjfkhS3lKuNK1yWfrbS8xyNaLvF1vqnxfs=;
 b=WqBS5nTnfkAhgKa6tgso3duR1P/Oik1ivwzWfFiYYtdI5+G4MWS02TwMaFNdr5m0y6
 7gHW/NjjvCitYOIy6IFUhKkoLOE+9KOIEZsqV+OrRm6JMN3t+vv0BJ7gdnlKFoKr8ckJ
 xaywR/+IAp7XyBbSSrw/b4fyoLC/thU7/Id6fY9MVOw8wFpdpJlcK/PIXilJihbuUV/M
 QaeNYOtYflfA6+5nrtf10MskWv+2XacAHutmEmxxzeRf7yDd4rpQ/kkEzgpEsc6mnTmm
 2iFYFX2uzfT3/YKK5Dwog5+xx67LmicSD8RwAwAhsY9n/qkOpIdJUwqNk5QTiryZKYHK
 JkEA==
X-Gm-Message-State: APjAAAWRB8bpqcq9SDHMNkhqOzxdBQQaRbMUVvxHY6tBrLwIxaQyBGCa
 +SzwAAmeXJyTk6Lg8ZXWCtWftA==
X-Google-Smtp-Source: APXvYqxsSjVBDXKrAXB+Ol6hJNn8lBeh6Uli3r8STc4zX1whTj18DOxIUXUWmFgZK8fM73WXMdJkPw==
X-Received: by 2002:a1c:4d08:: with SMTP id o8mr4266485wmh.86.1582884984271;
 Fri, 28 Feb 2020 02:16:24 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c11sm11450468wrp.51.2020.02.28.02.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 02:16:23 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E21DC1FF87;
 Fri, 28 Feb 2020 10:16:21 +0000 (GMT)
User-agent: mu4e 1.3.8; emacs 27.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-dev@lists.oasis-open.org, virtualization@lists.linux-foundation.org
Subject: VIRTIO adoption in other hypervisors
Date: Fri, 28 Feb 2020 10:16:21 +0000
Message-ID: <87mu93vwy2.fsf@linaro.org>
MIME-Version: 1.0
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

SGksCgpJJ20gY3VycmVudGx5IHRyeWluZyB0byBnZXQgbXkgaGVhZCBhcm91bmQgdmlydGlvIGFu
ZCB3YXMgd29uZGVyaW5nIGhvdwp3aWRlc3ByZWFkIGFkb3B0aW9uIG9mIHZpcnRpbyBpcyBhbW9u
Z3N0IHRoZSB2YXJpb3VzIGh5cGVydmlzb3JzIGFuZAplbXVsYXRvcnMgb3V0IHRoZXJlLgoKT2J2
aW91c2x5IEknbSBmYW1pbGlhciB3aXRoIFFFTVUgYm90aCB2aWEgS1ZNIGFuZCBldmVuIHdoZW4g
anVzdCBkb2luZwpwbGFpbiBlbXVsYXRpb24gKGFsdGhvdWdoIHdpdGggc29tZSByZXN0cmljdGlv
bnMpLiBBcyBmYXIgYXMgSSdtIGF3YXJlCnRoZSB2YXJpb3VzIFJ1c3QgYmFzZWQgVk1NcyBoYXZl
IHZhcnkgZGVncmVlcyBvZiBzdXBwb3J0IGZvciB2aXJ0aW8KZGV2aWNlcyBvdmVyIEtWTSBhcyB3
ZWxsLiBDcm9zVk0gc3BlY2lmaWNhbGx5IGlzIGVtYnJhY2luZyB2aXJ0aW8gZm9yCm11bHRpLXBy
b2Nlc3MgZGV2aWNlIGVtdWxhdGlvbi4KCkkgYmVsaWV2ZSB0aGVyZSBoYXMgYmVlbiBzb21lIGRl
dmVsb3BtZW50IHdvcmsgZm9yIHN1cHBvcnRpbmcgVklSVElPIG9uClhlbiBhbHRob3VnaCBpdCBz
ZWVtcyB0byBoYXZlIHN0YWxsZWQgYWNjb3JkaW5nIHRvOgoKICBodHRwczovL3dpa2kueGVucHJv
amVjdC5vcmcvd2lraS9WaXJ0aW9fT25fWGVuCgpSZWNlbnRseSBhdCBLVk0gRm9ydW0gdGhlcmUg
d2FzIEphbidzIHRhbGsgYWJvdXQgSW50ZXItVk0gc2hhcmVkIG1lbW9yeQp3aGljaCBwcm9wb3Nl
ZCBpdnNobWVtdjIgYXMgYSBWSVJUSU8gdHJhbnNwb3J0OgoKICBodHRwczovL2V2ZW50czE5Lmxp
bnV4Zm91bmRhdGlvbi5vcmcvZXZlbnRzL2t2bS1mb3J1bS0yMDE5L3Byb2dyYW0vc2NoZWR1bGUv
CgpBcyBJIHVuZGVyc3Rvb2QgaXQgdGhpcyB3b3VsZCBhbGxvdyBYZW4gKGFuZCBvdGhlciBoeXBl
cnZpc29ycykgYSBzaW1wbGUKd2F5IHRvIGJlIGFibGUgdG8gY2FycnkgdmlydGlvIHRyYWZmaWMg
YmV0d2VlbiBndWVzdCBhbmQgZW5kIHBvaW50LgoKU28gc29tZSBxdWVzdGlvbnM6CgogIC0gQW0g
SSBtaXNzaW5nIGFueXRoaW5nIG91dCBpbiB0aGF0IHN1bW1hcnk/CiAgLSBIb3cgYWJvdXQgSHlw
ZXJWIGFuZCB0aGUgT1NYIGVxdWl2YWxlbnQ/CiAgLSBEbyBhbnkgb3RoZXIgdHlwZS0xIGh5cGVy
dmlzb3JzIHN1cHBvcnQgdmlydGlvPwoKLS0gCkFsZXggQmVubsOpZQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxp
c3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0
cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
