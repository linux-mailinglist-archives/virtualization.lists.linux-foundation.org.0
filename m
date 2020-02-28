Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B58173D6F
	for <lists.virtualization@lfdr.de>; Fri, 28 Feb 2020 17:47:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D9B7620429;
	Fri, 28 Feb 2020 16:47:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z6S4vz77GumP; Fri, 28 Feb 2020 16:47:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1749B20402;
	Fri, 28 Feb 2020 16:47:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D194AC0177;
	Fri, 28 Feb 2020 16:47:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C5BEFC0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 16:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B109E20390
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 16:47:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QeksFArCEY2E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 16:47:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 588EF20402
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 16:47:37 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id j16so3722022wrt.3
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 08:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=hqdZ3zfVfi4HzE+vP/ibkIaCWKQSGWKHZPLXxris7LE=;
 b=u5FDX5Rom/VOg3uNakTyD8XyRkpyXcIUF7NME9VcB9GU7IvnfGN4xF84K3LdyI0OUs
 otcOA9PXm4qhA6Pc8nrvr7BlLejLovpuy29uLeZGqXvcsESxnithzW2S3LCse/NXjnuc
 AOQKe/a6ybnazAzVT99Z5Eff6iFAeZZzAJnr2m7JBZOy9CkEULwalkK+WSlc8z1oDaPB
 N6YpS66rrj+qE+kFUol7c3YDJSHOFjFgddcdGbZkmvIhM6TnoocNEHmb+14VA2U8D1ap
 qziG0BLedEBpH0pphjbf0hdrmWnVYBvwxDp3TwYAzCGxnaBW3jlBE/+eaCxoiQ6OeSjG
 G+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=hqdZ3zfVfi4HzE+vP/ibkIaCWKQSGWKHZPLXxris7LE=;
 b=e9DTCd4n1e0RdW73ZLeZp1HzP+jNMTRTyAGGyqiGLqvHVv0uCvJPJFIDTpBUy3A458
 CtfkCjH78wJDzPWMYZndcv4qBil6Jd1TaR3IlPf+Zm4GuFjjN3sg7HIVBrmniCr4qMxe
 nBvhYWZyqyTOYi76scCkr/TSsRjR+lxaQypxTI/mL9o9Dhb3KAlkJ1J/RDOIoxcnEur5
 IkqVMsp56LSO6tF/TQ8Ohr3TadaiZNTvETXeicZ/BPeYmhMPr0PMXE6ISsQZniweS3GR
 O4Ezl0nDRSZGPU9VzWMDDqRvsThvCxMx1hGVUowwnNPg68mlOJyOiPYKHlG3/VOlk2/R
 zZsQ==
X-Gm-Message-State: APjAAAXyMrkPcEZhO25wFBXUsXsGukUjIZqRkxQZpbEtxCszeecx3Jvu
 jDY9F+XTfnJVHK9Sqra2QEIOaA==
X-Google-Smtp-Source: APXvYqzr2cH4P2puxpWH8SHeBt+Zm46X7F7zRT6kTCEm1ea2UhVEQKraegBDoLNNxapdbGA2CAHN9A==
X-Received: by 2002:adf:90e1:: with SMTP id i88mr5786187wri.95.1582908455799; 
 Fri, 28 Feb 2020 08:47:35 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 16sm3008915wmi.0.2020.02.28.08.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 08:47:34 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 358E61FF87;
 Fri, 28 Feb 2020 16:47:33 +0000 (GMT)
References: <87mu93vwy2.fsf@linaro.org>
 <db75fc2b-ac2e-2351-cc3c-cdb42a50ac24@siemens.com>
 <0b80da21-ed40-c550-c605-031a209115b1@siemens.com>
User-agent: mu4e 1.3.8; emacs 27.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: VIRTIO adoption in other hypervisors
In-reply-to: <0b80da21-ed40-c550-c605-031a209115b1@siemens.com>
Date: Fri, 28 Feb 2020 16:47:33 +0000
Message-ID: <878skmwtei.fsf@linaro.org>
MIME-Version: 1.0
Cc: Wei Liu <liuw@liuw.name>, virtio-dev@lists.oasis-open.org,
 Stefano Stabellini <sstabellini@kernel.org>,
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

CkphbiBLaXN6a2EgPGphbi5raXN6a2FAc2llbWVucy5jb20+IHdyaXRlczoKCj4gT24gMjguMDIu
MjAgMTE6MzAsIEphbiBLaXN6a2Egd3JvdGU6Cj4+IE9uIDI4LjAyLjIwIDExOjE2LCBBbGV4IEJl
bm7DqWUgd3JvdGU6Cj4+PiBIaSwKPj4+CjxzbmlwPgo+Pj4gSSBiZWxpZXZlIHRoZXJlIGhhcyBi
ZWVuIHNvbWUgZGV2ZWxvcG1lbnQgd29yayBmb3Igc3VwcG9ydGluZyBWSVJUSU8gb24KPj4+IFhl
biBhbHRob3VnaCBpdCBzZWVtcyB0byBoYXZlIHN0YWxsZWQgYWNjb3JkaW5nIHRvOgo+Pj4KPj4+
ICAgIGh0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL1ZpcnRpb19Pbl9YZW4KPj4+Cj4+
PiBSZWNlbnRseSBhdCBLVk0gRm9ydW0gdGhlcmUgd2FzIEphbidzIHRhbGsgYWJvdXQgSW50ZXIt
Vk0gc2hhcmVkIG1lbW9yeQo+Pj4gd2hpY2ggcHJvcG9zZWQgaXZzaG1lbXYyIGFzIGEgVklSVElP
IHRyYW5zcG9ydDoKPj4+Cj4+PiAgICBodHRwczovL2V2ZW50czE5LmxpbnV4Zm91bmRhdGlvbi5v
cmcvZXZlbnRzL2t2bS1mb3J1bS0yMDE5L3Byb2dyYW0vc2NoZWR1bGUvIAo+Pj4KPj4+Cj4+PiBB
cyBJIHVuZGVyc3Rvb2QgaXQgdGhpcyB3b3VsZCBhbGxvdyBYZW4gKGFuZCBvdGhlciBoeXBlcnZp
c29ycykgYSBzaW1wbGUKPj4+IHdheSB0byBiZSBhYmxlIHRvIGNhcnJ5IHZpcnRpbyB0cmFmZmlj
IGJldHdlZW4gZ3Vlc3QgYW5kIGVuZCBwb2ludC4KPgo+IEFuZCB0byBjbGFyaWZ5IHRoZSBzY29w
ZSBvZiB0aGlzIGVmZm9ydDogdmlydGlvLW92ZXItaXZzaG1lbSBpcyBub3QKPiB0aGUgZmFzdGVz
dCBvcHRpb24gdG8gb2ZmZXIgdmlydGlvIHRvIGEgZ3Vlc3QgKHN0YXRpYyAiRE1BIiB3aW5kb3cp
LAo+IGJ1dCBpdCBpcyB0aGUgc2ltcGxlc3Qgb25lIGZyb20gdGhlIGh5cGVydmlzb3IgUG9WIGFu
ZCwgdGh1cywgYWxzbwo+IGxpa2VseSB0aGUgZWFzaWVzdCBvbmUgdG8gYXJndWUgb3ZlciB3aGVu
IGl0IGNvbWVzIHRvIHNlY3VyaXR5IGFuZAo+IHNhZmV0eS4KClNvIHRvIGRyaWxsIGRvd24gb24g
dGhpcyBpcyB0aGlzIGEgcGFydGljdWxhciBwcm9ibGVtIHdpdGggdHlwZS0xCmh5cGVydmlzb3Jz
PwoKSXQgc2VlbXMgdG8gbWUgYW55IEtWTS1saWtlIHJ1biBsb29wIHRyaXZpYWxseSBzdXBwb3J0
cyBhIHJhbmdlIG9mCnZpcnRpbyBkZXZpY2VzIGJ5IHZpcnR1ZSBvZiB0cmFwcGluZyBhY2Nlc3Nl
cyB0byB0aGUgc2lnbmFsbGluZyBhcmVhIG9mCmEgdmlydHF1ZXVlIGFuZCBhbGxvd2luZyB0aGUg
Vk1NIHRvIGhhbmRsZSB0aGUgdHJhbnNhY3Rpb24gd2hpY2ggZXZlcgp3YXkgaXQgc2VlcyBmaXQu
CgpJJ3ZlIG5vdCBxdWl0ZSB1bmRlcnN0b29kIHRoZSB3YXkgWGVuIGludGVyZmFjZXMgdG8gUUVN
VSBhc2lkZSBmcm9tIGl0J3MKZGlmZmVyZW50IHRvIGV2ZXJ5dGhpbmcgZWxzZS4gTW9yZSBvdmVy
IGl0IHNlZW1zIHRoZSB0eXBlLTEgaHlwZXJ2aXNvcnMKYXJlIG1vcmUgaW50ZXJlc3RlZCBpbiBw
cm92aWRpbmcgYmV0dGVyIGlzb2xhdGlvbiBiZXR3ZWVuIHNlZ21lbnRzIG9mIGEKc3lzdGVtIHdo
ZXJlYXMgVklSVElPIGN1cnJlbnRseSBhc3N1bWVzIGVpdGhlciB0aGUgVk1NIG9yIHRoZSBoeXBl
cnZpc29yCmhhcyBmdWxsIGFjY2VzcyB0aGUgZnVsbCBndWVzdCBhZGRyZXNzIHNwYWNlLiBJJ3Zl
IHNlZW4gcXVpdGUgYSBsb3Qgb2YKc2xpZGVzIHRoYXQgd2FudCB0byBpc29sYXRlIHNlY3Rpb25z
IG9mIGRldmljZSBlbXVsYXRpb24gdG8gc2VwYXJhdGUKcHJvY2Vzc2VzIG9yIGV2ZW4gc2VwYXJh
dGUgZ3Vlc3QgVk1zLgoKLS0gCkFsZXggQmVubsOpZQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVh
bGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZv
dW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
