Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE0D8BBD8
	for <lists.virtualization@lfdr.de>; Tue, 13 Aug 2019 16:45:23 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BCF70C8E;
	Tue, 13 Aug 2019 14:45:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B55D0BDC
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 14:45:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2F7B589D
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 14:45:15 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id t16so17886168wra.6
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 07:45:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=jWtEd3owCPSOaSqnFheJ8jWjvLGAgQi5lkfcBCpyD7o=;
	b=omLoXWwqqUBQDedo+cMltL9f5jrFO2cXu5aujpqXrOlueguL5z3I+srt0MG1NVgd+/
	sDExEy0e8GijEzxDXL7lt+7jQtP2zkYko/W4XOH0tRBuec4YunPdKINLbl/6W7srywXB
	sGUBCWzhEVd2Y5aCLhgFDsqG4/GQR99TlZxRz+81etgdUjUjzMJF5BiUPYVVR19J02Qj
	9hJRBilSBm46yfMYuRCzX59hNY1xKDGPkQGdHeXlHIiZha827ByY2Bgy72gxfnz+L/WH
	ztpg7YOjZdR2qL1G7UBbXmrNBcuCB7lAKIw7+DNLE7ZN7Zzu5CYiGvWW+iwI8dFXLU/D
	ZGNA==
X-Gm-Message-State: APjAAAUaVQcpiQ8VchuEwVmZ4pDkeP4IwhOzf7WfV7Lj7oR+EQW8rNbo
	ydkjK7gUvB9JrexNHMtHkQd8Lg==
X-Google-Smtp-Source: APXvYqwcGE4nFuUbUV12L+CuV8ssqEc28LeuFzgoubUsbyKYX9+fTashqIpI1VrJDY8+MqB+OZnDSA==
X-Received: by 2002:adf:fc51:: with SMTP id e17mr43958026wrs.348.1565707513708;
	Tue, 13 Aug 2019 07:45:13 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5193:b12b:f4df:deb6?
	([2001:b07:6468:f312:5193:b12b:f4df:deb6])
	by smtp.gmail.com with ESMTPSA id
	x20sm237275027wrg.10.2019.08.13.07.45.12
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Aug 2019 07:45:13 -0700 (PDT)
Subject: Re: [RFC PATCH v6 14/92] kvm: introspection: handle introspection
	commands before returning to guest
To: =?UTF-8?Q?Adalbert_Laz=c4=83r?= <alazar@bitdefender.com>,
	kvm@vger.kernel.org
References: <20190809160047.8319-1-alazar@bitdefender.com>
	<20190809160047.8319-15-alazar@bitdefender.com>
	<645d86f5-67f6-f5d3-3fbb-5ee9898a7ef8@redhat.com>
	<5d52c10e.1c69fb81.26904.fd34SMTPIN_ADDED_BROKEN@mx.google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <97cdf9cb-286c-2387-6cb5-003b30f74c7e@redhat.com>
Date: Tue, 13 Aug 2019 16:45:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5d52c10e.1c69fb81.26904.fd34SMTPIN_ADDED_BROKEN@mx.google.com>
Content-Language: en-US
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Weijiang Yang <weijiang.yang@intel.com>, Yu C Zhang <yu.c.zhang@intel.com>,
	=?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	=?UTF-8?Q?Samuel_Laur=c3=a9n?= <samuel.lauren@iki.fi>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	Patrick Colp <patrick.colp@oracle.com>,
	Mathieu Tarral <mathieu.tarral@protonmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?Q?Mircea_C=c3=aerjaliu?= <mcirjaliu@bitdefender.com>,
	=?UTF-8?Q?Mihai_Don=c8=9bu?= <mdontu@bitdefender.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

T24gMTMvMDgvMTkgMTU6NTQsIEFkYWxiZXJ0IExhesSDciB3cm90ZToKPiAgICAgTGVhdmluZyBr
dm1fdmNwdV9ibG9jaygpIGluIG9yZGVyIHRvIGhhbmRsZSBhIHJlcXVlc3Qgc3VjaCBhcyAncGF1
c2UnLAo+ICAgICB3b3VsZCBjYXVzZSB0aGUgdkNQVSB0byBlbnRlciB0aGUgZ3Vlc3Qgd2hlbiBy
ZXN1bWVkLiBNb3N0IG9mIHRoZQo+ICAgICB0aW1lIHRoaXMgZG9lcyBub3QgYXBwZWFyIHRvIGJl
IGFuIGlzc3VlLCBidXQgZHVyaW5nIGVhcmx5IGJvb3QgaXQKPiAgICAgY2FuIGhhcHBlbiBmb3Ig
YSBub24tYm9vdCB2Q1BVIHRvIHN0YXJ0IGV4ZWN1dGluZyBjb2RlIGZyb20gYXJlYXMgdGhhdAo+
ICAgICBmaXJzdCBuZWVkZWQgdG8gYmUgc2V0IHVwIGJ5IHZDUFUgIzAuCj4gICAgIAo+ICAgICBJ
biBhIHBhcnRpY3VsYXIgY2FzZSwgdkNQVSAjMSBleGVjdXRlZCBjb2RlIHdoaWNoIHJlc2lkZWQg
aW4gYW4gYXJlYQo+ICAgICBub3QgY292ZXJlZCBieSBhIG1lbXNsb3QsIHdoaWNoIGNhdXNlZCBh
biBFUFQgdmlvbGF0aW9uIHRoYXQgZ290Cj4gICAgIHR1cm5lZCBpbiBtbXVfc2V0X3NwdGUoKSBp
bnRvIGEgTU1JTyByZXF1ZXN0IHRoYXQgcmVxdWlyZWQgZW11bGF0aW9uLgo+ICAgICBVbmZvcnR1
bmF0ZWxseSwgdGhlIGVtdWxhdG9yIHRyaXBwZWQsIGV4aXRlZCB0byB1c2Vyc3BhY2UgYW5kIHRo
ZSBWTQo+ICAgICB3YXMgYWJvcnRlZC4KCk9rYXksIHRoaXMgbWFrZXMgc2Vuc2UuICBNYXliZSB5
b3Ugd2FudCB0byBoYW5kbGUgS1ZNX1JFUV9JTlRST1NQRUNUSU9OCmluIHZjcHVfcnVuIHJhdGhl
ciB0aGFuIHZjcHVfZW50ZXJfZ3Vlc3Q/CgpQYW9sbwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVh
bGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZv
dW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
