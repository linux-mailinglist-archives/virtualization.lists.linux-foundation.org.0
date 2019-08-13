Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5A78B437
	for <lists.virtualization@lfdr.de>; Tue, 13 Aug 2019 11:34:15 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E5489CAB;
	Tue, 13 Aug 2019 09:34:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 08092BE4
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 09:34:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6B1CE89D
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 09:34:07 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p74so847638wme.4
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 02:34:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=udqo7kROlqFqisXj5oz1sWF1oRTaX6uM+TM5JcYIbqE=;
	b=c8UkaxRJzaBPfJ8pF7xn8/k5ybhtLtN0d8lUgh7PIphCEW2q7aZgS/XEg3+6qM7dTV
	afqrh3ky6npTW3PSvIcOg7Yyopk69dYZ2+i+bqEZI3V9c+Wtw/6OFaJVgKOxiS2FAo7m
	4kURW0RqDk7BQV0ig1KLvDLbPoXtM9htI3V5qMAzHiC6akzVavbiPfq5vwtwLLNR+UX7
	r5zoFp6roWfGDrgtGgMeWZ++2VJlQfPKsQ1TMcmKzMlgudDBf+VH5xne0+cTA0/n6L78
	AYtiIKkZzlAW70vRGjmkBP+hbObzcjvrp6vmW35myG0fWBXA8VS/b+yTr01IApHAKuDy
	O1FA==
X-Gm-Message-State: APjAAAWNPj8pkFiRB0DOLIHm/8xXxXuhv4rKm2ViyjYKlK5ZRefQt0nv
	BU12oglZvk0FgcGzmFiAzoLrnw==
X-Google-Smtp-Source: APXvYqxoXSubblXg/ubxv7gJT3sw06cSBwphouvlACdbw0oLuVuxziG5Y6exA/d83ei6Qsn3CzcqSw==
X-Received: by 2002:a1c:4d05:: with SMTP id o5mr1991136wmh.129.1565688845929; 
	Tue, 13 Aug 2019 02:34:05 -0700 (PDT)
Received: from [192.168.10.150] ([93.56.166.5])
	by smtp.gmail.com with ESMTPSA id r23sm996180wmc.38.2019.08.13.02.34.04
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Aug 2019 02:34:05 -0700 (PDT)
Subject: Re: [RFC PATCH v6 00/92] VM introspection
To: =?UTF-8?Q?Adalbert_Laz=c4=83r?= <alazar@bitdefender.com>,
	kvm@vger.kernel.org
References: <20190809160047.8319-1-alazar@bitdefender.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <a048da21-0b30-8615-a6e5-f3e8f45e7920@redhat.com>
Date: Tue, 13 Aug 2019 11:34:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809160047.8319-1-alazar@bitdefender.com>
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

T24gMDkvMDgvMTkgMTc6NTksIEFkYWxiZXJ0IExhesSDciB3cm90ZToKPiAKPiBQYXRjaGVzIDEt
MjA6IHVucm9sbCBhIGJpZyBwYXJ0IG9mIHRoZSBLVk0gaW50cm9zcGVjdGlvbiBzdWJzeXN0ZW0s
Cj4gc2VudCBpbiBvbmUgcGF0Y2ggaW4gdGhlIHByZXZpb3VzIHZlcnNpb25zLgo+IAo+IFBhdGNo
ZXMgMjEtMjQ6IGV4dGVuZCB0aGUgY3VycmVudCBwYWdlIHRyYWNraW5nIGNvZGUuCj4gCj4gUGF0
Y2hlcyAyNS0zMzogbWFrZSB1c2Ugb2YgcGFnZSB0cmFja2luZyB0byBzdXBwb3J0IHRoZQo+IEtW
TUlfU0VUX1BBR0VfQUNDRVNTIGludHJvc3BlY3Rpb24gY29tbWFuZCBhbmQgdGhlIEtWTUlfRVZF
TlRfUEYgZXZlbnQKPiAob24gRVBUIHZpb2xhdGlvbnMgY2F1c2VkIGJ5IHRoZSB0cmFja2luZyBz
ZXR0aW5ncykuCj4gCj4gUGF0Y2hlcyAzNC00MjogaW5jbHVkZSB0aGUgU1BQIGZlYXR1cmUgKEVu
YWJsZSBTdWItcGFnZQo+IFdyaXRlIFByb3RlY3Rpb24gU3VwcG9ydCksIGFscmVhZHkgc2VudCB0
byBLVk0gbGlzdDoKPiAKPiAJaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDE5MDcxNzEz
Mzc1MS4xMjkxMC0xLXdlaWppYW5nLnlhbmdAaW50ZWwuY29tLwo+IAo+IFBhdGNoZXMgNDMtNDY6
IGFkZCB0aGUgY29tbWFuZHMgbmVlZGVkIHRvIHVzZSBTUFAuCj4gCj4gUGF0Y2hlcyA0Ny02Mzog
dW5yb2xsIGFsbW9zdCBhbGwgdGhlIHJlc3Qgb2YgdGhlIGludHJvc3BlY3Rpb24gY29kZS4KPiAK
PiBQYXRjaGVzIDY0LTY3OiBhZGQgc2luZ2xlLXN0ZXBwaW5nLCBtb3N0bHkgYXMgYSB3YXkgdG8g
b3ZlcmNvbWUgdGhlCj4gdW5pbXBsZW1lbnRlZCBpbnN0cnVjdGlvbnMsIGJ1dCBhbHNvIGFzIGEg
ZmVhdHVyZSBmb3IgdGhlIGludHJvc3BlY3Rpb24KPiB0b29sLgo+IAo+IFBhdGNoZXMgNjgtNzA6
IGNvdmVyIG1vcmUgY2FzZXMgcmVsYXRlZCB0byBFUFQgdmlvbGF0aW9ucy4KPiAKPiBQYXRjaGVz
IDcxLTczOiBhZGQgdGhlIHJlbW90ZSBtYXBwaW5nIGZlYXR1cmUsIGFsbG93aW5nIHRoZSBpbnRy
b3NwZWN0aW9uCj4gdG9vbCB0byBtYXAgaW50byBpdHMgYWRkcmVzcyBzcGFjZSBhIHBhZ2UgZnJv
bSBndWVzdCBtZW1vcnkuCj4gCj4gUGF0Y2hlcyA3NDogYWRkIGEgZml4IHRvIGh5cGVyY2FsbCBl
bXVsYXRpb24uCj4gCj4gUGF0Y2hlcyA3NS03NjogZGlzYWJsZSBzb21lIGZlYXR1cmVzL29wdGlt
aXphdGlvbnMgd2hlbiB0aGUgaW50cm9zcGVjdGlvbgo+IGNvZGUgaXMgcHJlc2VudC4KPiAKPiBQ
YXRjaGVzIDc3LTc4OiBhZGQgdHJhY2UgZnVuY3Rpb25zIGZvciB0aGUgaW50cm9zcGVjdGlvbiBj
b2RlIGFuZCBjaGFuZ2UKPiBzb21lIHJlbGF0ZWQgdG8gaW50ZXJydXB0cy9leGNlcHRpb25zIGlu
amVjdGlvbi4KPiAKPiBQYXRjaGVzIDc5LTkyOiBuZXcgaW5zdHJ1Y3Rpb24gZm9yIHRoZSB4ODYg
ZW11bGF0b3IsIGluY2x1ZGluZyBjbXB4Y2hnCj4gZml4ZXMuCgpUaGFua3MgZm9yIHRoZSB2ZXJ5
IGdvb2QgZXhwbGFuYXRpb24uICBBcGFydCBmcm9tIHRoZSBjb21wbGljYXRlZCBmbG93Cm9mIEtW
TSByZXF1ZXN0IGhhbmRsaW5nIGFuZCBLVk0gcmVwbHksIHRoZSBtYWluIGlzc3VlIGlzIHRoZSBj
b21wbGV0ZQpsYWNrIG9mIHRlc3RjYXNlcy4gIFRoZXJlIHNob3VsZCBiZSBhIGt2bWlfdGVzdCBp
bgp0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0sIGFuZCBlYWNoIHBhdGNoIGFkZGluZyBhIG5l
dyBpb2N0bCBvciBldmVudApzaG91bGQgYWRkIGEgbmV3IHRlc3RjYXNlLgoKUGFvbG8KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24g
bWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0
dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxp
emF0aW9u
