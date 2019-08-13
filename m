Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAFC8B3C3
	for <lists.virtualization@lfdr.de>; Tue, 13 Aug 2019 11:15:51 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B2024CBB;
	Tue, 13 Aug 2019 09:15:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2A144CA6
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 09:15:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 935858AC
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 09:15:43 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id n9so107169209wru.0
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 02:15:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=q7bgqMdQ4an3+fW9pjXHTss4SNTSFngzufR2wW+436s=;
	b=Y2Bmoidwv8fYJpGD5VtRsavbrGB3YSkT0XJFKhm7cxxYDImtLQUzhCD7go2++ts9rg
	jL8xQh0zN3PekzKb1xMJT45wgB2/POIvg3m00IwAXypehIS+ZhIZtukChfXnz8yQZ+NV
	Xo3aPtvmmumpJR804j883d3pknTqR4zoyG3LX+vF5LsS4y2bD9DGh/N84PBUuHHtzGfv
	CQsAzQ+GOiyXWMbcq4Y+P/rP6eSKbxD6zvGVF6NuocEzJEXiYo+w3r52FvY2GGzcYi/Z
	jzksWYsPloDHNzu6CROmvlprK+Uj0KuEKQbRNQP/g9J4xpOLHTdMZPNBgD447+6Nkbhn
	wp4A==
X-Gm-Message-State: APjAAAVCAnfJwwF8RlXg9PNERmpl12akbW1CZpHn8BIA2ZbrDPtSfl9G
	fLkTUjdDIK8e+q8iZbZMC+6Xkg==
X-Google-Smtp-Source: APXvYqxstOWD8uGBtXH2sZT96q5cW3boODxMOIYCbZ+H7TsBnLr+a/3ZIecGYglK7JULc1kUyTstKQ==
X-Received: by 2002:adf:dc0f:: with SMTP id t15mr25505581wri.50.1565687742155; 
	Tue, 13 Aug 2019 02:15:42 -0700 (PDT)
Received: from [192.168.10.150] ([93.56.166.5])
	by smtp.gmail.com with ESMTPSA id w5sm914921wmm.43.2019.08.13.02.15.40
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Aug 2019 02:15:41 -0700 (PDT)
Subject: Re: [RFC PATCH v6 06/92] kvm: introspection: add
	KVMI_CONTROL_CMD_RESPONSE
To: =?UTF-8?Q?Adalbert_Laz=c4=83r?= <alazar@bitdefender.com>,
	kvm@vger.kernel.org
References: <20190809160047.8319-1-alazar@bitdefender.com>
	<20190809160047.8319-7-alazar@bitdefender.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <e8f59b08-734a-2ce1-ae28-3cc9d90c0bcb@redhat.com>
Date: Tue, 13 Aug 2019 11:15:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809160047.8319-7-alazar@bitdefender.com>
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

T24gMDkvMDgvMTkgMTc6NTksIEFkYWxiZXJ0IExhesSDciB3cm90ZToKPiArSWYgYG5vd2AgaXMg
MSwgdGhlIGNvbW1hbmQgcmVwbHkgaXMgZW5hYmxlZC9kaXNhYmxlZCAoYWNjb3JkaW5nIHRvCj4g
K2BlbmFibGVgKSBzdGFydGluZyB3aXRoIHRoZSBjdXJyZW50IGNvbW1hbmQuIEZvciBleGFtcGxl
LCBgZW5hYmxlPTBgCj4gK2FuZCBgbm93PTFgIG1lYW5zIHRoYXQgdGhlIHJlcGx5IGlzIGRpc2Fi
bGVkIGZvciB0aGlzIGNvbW1hbmQgdG9vLAo+ICt3aGlsZSBgZW5hYmxlPTBgIGFuZCBgbm93PTBg
IG1lYW5zIHRoYXQgYSByZXBseSB3aWxsIGJlIHNlbmQgZm9yIHRoaXMKPiArY29tbWFuZCwgYnV0
IG5vdCBmb3IgdGhlIG5leHQgb25lcyAodW50aWwgZW5hYmxlZCBiYWNrIHdpdGggYW5vdGhlcgo+
ICsqS1ZNSV9DT05UUk9MX0NNRF9SRVNQT05TRSopLgo+ICsKPiArVGhpcyBjb21tYW5kIGlzIHVz
ZWQgYnkgdGhlIGludHJvc3BlY3Rpb24gdG9vbCB0byBkaXNhYmxlIHRoZSByZXBsaWVzCj4gK2Zv
ciBjb21tYW5kcyByZXR1cm5pbmcgYW4gZXJyb3IgY29kZSBvbmx5IChlZy4gKktWTUlfU0VUX1JF
R0lTVEVSUyopCj4gK3doZW4gYW4gZXJyb3IgaXMgbGVzcyBsaWtlbHkgdG8gaGFwcGVuLiBGb3Ig
ZXhhbXBsZSwgdGhlIGZvbGxvd2luZwo+ICtjb21tYW5kcyBjYW4gYmUgdXNlZCB0byByZXBseSB0
byBhbiBldmVudCB3aXRoIGEgc2luZ2xlIGB3cml0ZSgpYCBjYWxsOgo+ICsKPiArCUtWTUlfQ09O
VFJPTF9DTURfUkVTUE9OU0UgZW5hYmxlPTAgbm93PTEKPiArCUtWTUlfU0VUX1JFR0lTVEVSUyB2
Y3B1PU4KPiArCUtWTUlfRVZFTlRfUkVQTFkgICB2Y3B1PU4KPiArCUtWTUlfQ09OVFJPTF9DTURf
UkVTUE9OU0UgZW5hYmxlPTEgbm93PTAKCkkgZG9uJ3QgdW5kZXJzdGFuZCB0aGUgdXNhZ2UuICBJ
cyB0aGVyZSBhbnkgY2FzZSB3aGVyZSB5b3Ugd2FudCBub3cgPT0gMQphY3R1YWxseT8gIENhbiB5
b3UganVzdCBzYXkgdGhhdCBLVk1JX0NPTlRST0xfQ01EX1JFU1BPTlNFIG5ldmVyIGhhcyBhCnJl
cGx5LCBvciB0byBtYWtlIG5vdz09ZW5hYmxlPwoKPiArCWlmIChlcnIpCj4gKwkJa3ZtaV93YXJu
KGlrdm0sICJFcnJvciBjb2RlICVkIGRpc2NhcmRlZCBmb3IgbWVzc2FnZSBpZCAlZFxuIiwKPiAr
CQkJICBlcnIsIG1zZy0+aWQpOwo+ICsKCldvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8gZXZlbiBjbG9z
ZSB0aGUgc29ja2V0IGlmIHRoZXJlIGlzIGFuIGVycm9yPwoKUGFvbG8KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBs
aXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlz
dHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
