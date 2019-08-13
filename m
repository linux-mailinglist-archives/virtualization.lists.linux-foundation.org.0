Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BBF8B2D6
	for <lists.virtualization@lfdr.de>; Tue, 13 Aug 2019 10:47:46 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6E905C59;
	Tue, 13 Aug 2019 08:47:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B9160C59
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 08:47:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 249018D
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 08:47:39 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id m125so721683wmm.3
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 01:47:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=dot1gc/mMlmPmCzz2QNsuI+h9x0oQ5vgk6vGPP9o7BE=;
	b=Hau2YU7dDRlabb7BIZ8SEuqkAeahxApLLXZhNKIOoHsJWpGvqQ79thTlaNl6ki/Ehj
	f3Olak+fRCW6q3F4b8O6VSHgYBKeJ8kczsPhWJuIbzO5IC8GXtcKC7q2B51GdJccpRKw
	2uzV5AbnrSUTRpL7iRG8IUfADO668rI9oTYq9vM0iJaIa+2U2fiZY6+F2Ub8WjS3CmjK
	rn6aSbWmGmwSGxxvsC54CWM9tkujxRilhyVFa5ZWpZx4OnM10jj3xUR9niP+Birl/QEq
	ierERtwtXI+zkY9SoPzY0yAUQEfc363WEpG9pBkD2PGPiOFqD92AfKKY9jE1jA+NAv7B
	DkiQ==
X-Gm-Message-State: APjAAAWiMhS63x/u+XT1T4Tv6eY6DOAKbgLXnVYcy/WjZJrxAIOk/FL1
	Kv94ZP9LJvRI9wCHdoppnUxArg==
X-Google-Smtp-Source: APXvYqzu741BNphc7Bkte8hG3txzzfxmRNvj7kUnHgJredomsRJ9fKepXbx6ZmCo5ts7buHZQwE5Qw==
X-Received: by 2002:a1c:2ec6:: with SMTP id u189mr1791329wmu.67.1565686057680; 
	Tue, 13 Aug 2019 01:47:37 -0700 (PDT)
Received: from [192.168.10.150] ([93.56.166.5])
	by smtp.gmail.com with ESMTPSA id w15sm832270wmi.19.2019.08.13.01.47.36
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Aug 2019 01:47:37 -0700 (PDT)
Subject: Re: [RFC PATCH v6 75/92] kvm: x86: disable gpa_available optimization
	in emulator_read_write_onepage()
To: =?UTF-8?Q?Adalbert_Laz=c4=83r?= <alazar@bitdefender.com>,
	kvm@vger.kernel.org
References: <20190809160047.8319-1-alazar@bitdefender.com>
	<20190809160047.8319-76-alazar@bitdefender.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <eb748e05-8289-0c05-6907-b6c898f6080b@redhat.com>
Date: Tue, 13 Aug 2019 10:47:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809160047.8319-76-alazar@bitdefender.com>
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

T24gMDkvMDgvMTkgMTg6MDAsIEFkYWxiZXJ0IExhesSDciB3cm90ZToKPiBJZiB0aGUgRVBUIHZp
b2xhdGlvbiB3YXMgY2F1c2VkIGJ5IGFuIGV4ZWN1dGUgcmVzdHJpY3Rpb24gaW1wb3NlZCBieSB0
aGUKPiBpbnRyb3NwZWN0aW9uIHRvb2wsIGdwYV9hdmFpbGFibGUgd2lsbCBwb2ludCB0byB0aGUg
aW5zdHJ1Y3Rpb24gcG9pbnRlciwKPiBub3QgdGhlIHRvIHRoZSByZWFkL3dyaXRlIGxvY2F0aW9u
IHRoYXQgaGFzIHRvIGJlIHVzZWQgdG8gZW11bGF0ZSB0aGUKPiBjdXJyZW50IGluc3RydWN0aW9u
Lgo+IAo+IFRoaXMgb3B0aW1pemF0aW9uIHNob3VsZCBiZSBkaXNhYmxlZCBvbmx5IHdoZW4gdGhl
IFZNIGlzIGludHJvc3BlY3RlZCwKPiBub3QganVzdCBiZWNhdXNlIHRoZSBpbnRyb3NwZWN0aW9u
IHN1YnN5c3RlbSBpcyBwcmVzZW50Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFkYWxiZXJ0IExhesSD
ciA8YWxhemFyQGJpdGRlZmVuZGVyLmNvbT4KClRoZSByaWdodCB0aGluZyB0byBkbyBpcyB0byBu
b3Qgc2V0IGdwYV9hdmFpbGFibGUgZm9yIGZldGNoIGZhaWx1cmVzIGluIAprdm1fbW11X3BhZ2Vf
ZmF1bHQgaW5zdGVhZDoKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0vbW11LmMgYi9hcmNoL3g4
Ni9rdm0vbW11LmMKaW5kZXggMjQ4NDNjZjQ5NTc5Li4xYmRjYTQwZmE4MzEgMTAwNjQ0Ci0tLSBh
L2FyY2gveDg2L2t2bS9tbXUuYworKysgYi9hcmNoL3g4Ni9rdm0vbW11LmMKQEAgLTUzNjQsOCAr
NTM2NCwxMiBAQCBpbnQga3ZtX21tdV9wYWdlX2ZhdWx0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwg
Z3ZhX3QgY3IyLCB1NjQgZXJyb3JfY29kZSwKIAllbnVtIGVtdWxhdGlvbl9yZXN1bHQgZXI7CiAJ
Ym9vbCBkaXJlY3QgPSB2Y3B1LT5hcmNoLm1tdS0+ZGlyZWN0X21hcDsKIAotCS8qIFdpdGggc2hh
ZG93IHBhZ2UgdGFibGVzLCBmYXVsdF9hZGRyZXNzIGNvbnRhaW5zIGEgR1ZBIG9yIG5HUEEuICAq
LwotCWlmICh2Y3B1LT5hcmNoLm1tdS0+ZGlyZWN0X21hcCkgeworCS8qCisJICogV2l0aCBzaGFk
b3cgcGFnZSB0YWJsZXMsIGZhdWx0X2FkZHJlc3MgY29udGFpbnMgYSBHVkEgb3IgbkdQQS4KKwkg
KiBPbiBhIGZldGNoIGZhdWx0LCBmYXVsdF9hZGRyZXNzIGNvbnRhaW5zIHRoZSBpbnN0cnVjdGlv
biBwb2ludGVyLgorCSAqLworCWlmICh2Y3B1LT5hcmNoLm1tdS0+ZGlyZWN0X21hcCAmJgorCSAg
ICBsaWtlbHkoIShlcnJvcl9jb2RlICYgUEZFUlJfRkVUQ0hfTUFTSykpIHsKIAkJdmNwdS0+YXJj
aC5ncGFfYXZhaWxhYmxlID0gdHJ1ZTsKIAkJdmNwdS0+YXJjaC5ncGFfdmFsID0gY3IyOwogCX0K
CgpQYW9sbwoKPiAtLS0KPiAgYXJjaC94ODYva3ZtL3g4Ni5jIHwgMiArLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJj
aC94ODYva3ZtL3g4Ni5jIGIvYXJjaC94ODYva3ZtL3g4Ni5jCj4gaW5kZXggOTY1YzRmMDEwOGVi
Li4zOTc1MzMxMjMwYjkgMTAwNjQ0Cj4gLS0tIGEvYXJjaC94ODYva3ZtL3g4Ni5jCj4gKysrIGIv
YXJjaC94ODYva3ZtL3g4Ni5jCj4gQEAgLTU1MzIsNyArNTUzMiw3IEBAIHN0YXRpYyBpbnQgZW11
bGF0b3JfcmVhZF93cml0ZV9vbmVwYWdlKHVuc2lnbmVkIGxvbmcgYWRkciwgdm9pZCAqdmFsLAo+
ICAJICogb3BlcmF0aW9uIHVzaW5nIHJlcCB3aWxsIG9ubHkgaGF2ZSB0aGUgaW5pdGlhbCBHUEEg
ZnJvbSB0aGUgTlBGCj4gIAkgKiBvY2N1cnJlZC4KPiAgCSAqLwo+IC0JaWYgKHZjcHUtPmFyY2gu
Z3BhX2F2YWlsYWJsZSAmJgo+ICsJaWYgKHZjcHUtPmFyY2guZ3BhX2F2YWlsYWJsZSAmJiAha3Zt
aV9pc19wcmVzZW50KCkgJiYKPiAgCSAgICBlbXVsYXRvcl9jYW5fdXNlX2dwYShjdHh0KSAmJgo+
ICAJICAgIChhZGRyICYgflBBR0VfTUFTSykgPT0gKHZjcHUtPmFyY2guZ3BhX3ZhbCAmIH5QQUdF
X01BU0spKSB7Cj4gIAkJZ3BhID0gdmNwdS0+YXJjaC5ncGFfdmFsOwo+IAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGlu
ZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8v
bGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
