Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB728B3D8
	for <lists.virtualization@lfdr.de>; Tue, 13 Aug 2019 11:16:14 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 05199CBF;
	Tue, 13 Aug 2019 09:16:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B0E8CCA6
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 09:16:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 262848AC
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 09:16:06 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id l2so806370wmg.0
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 02:16:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=rJyEXL/9pmUa8F8Nq9N9p+VTELu7g73JrfbMzEYtsqw=;
	b=HM3+MnQd97+lQFbxkowH/FCH0YdQ+5rxCxid1QmQo4D8V8OkzxAzIdw3TnvImxVtjQ
	YySBIcR3marus7lJCoEt6/DTnivjgAnLO3uxKocgkIiyDkt8eyRkqhmfvA/jABiWlNTy
	UE0izNA0vD8auwP/AnaAq1wUVXB13z+Ienk1tMCQTsyJikp7Lqdr1ZG7JSNloNuhr6S5
	l4yd+3PYolGMgdCFZtXOIn/Xuq032O72OAzKPQJDmzn5ApHBbwbhhif3ndOKNDB5LRec
	MTcfjivMCC2e2BIZHrk0WuNl2z2+uNsRM45senKeWL4C7XsrTXWQDZJ76kjpXsbu4g3L
	hlCA==
X-Gm-Message-State: APjAAAUSLAK7lGHFc2M3nMpEF+o2Sp21OOk69QaJZ16Kiy6SSiVRyD4/
	cct7lI9/BO4BsECWVi9vkqVjNA==
X-Google-Smtp-Source: APXvYqwm309us5aZi/frD8eACHl5aijviV3HAVkqCeaBNsVD1mdnoZLmf1PImPsBNT+r6Tg0wB86fA==
X-Received: by 2002:a7b:cf0b:: with SMTP id l11mr2056631wmg.143.1565687764702; 
	Tue, 13 Aug 2019 02:16:04 -0700 (PDT)
Received: from [192.168.10.150] ([93.56.166.5])
	by smtp.gmail.com with ESMTPSA id
	c15sm59116320wrb.80.2019.08.13.02.16.03
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Aug 2019 02:16:04 -0700 (PDT)
Subject: Re: [RFC PATCH v6 07/92] kvm: introspection: honor the reply option
	when handling the KVMI_GET_VERSION command
To: =?UTF-8?Q?Adalbert_Laz=c4=83r?= <alazar@bitdefender.com>,
	kvm@vger.kernel.org
References: <20190809160047.8319-1-alazar@bitdefender.com>
	<20190809160047.8319-8-alazar@bitdefender.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <a5cdbbd4-6f25-a0a5-054e-5810b5828a48@redhat.com>
Date: Tue, 13 Aug 2019 11:16:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809160047.8319-8-alazar@bitdefender.com>
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

T24gMDkvMDgvMTkgMTc6NTksIEFkYWxiZXJ0IExhesSDciB3cm90ZToKPiBPYnZpb3VzbHksIHRo
ZSBLVk1JX0dFVF9WRVJTSU9OIGNvbW1hbmQgbXVzdCBub3QgYmUgdXNlZCB3aGVuIHRoZSBjb21t
YW5kCj4gcmVwbHkgaXMgZGlzYWJsZWQgYnkgYSBwcmV2aW91cyBLVk1JX0NPTlRST0xfQ01EX1JF
U1BPTlNFIGNvbW1hbmQuCj4gCj4gVGhpcyBjb21taXQgY2hhbmdlcyB0aGUgY29kZSBwYXRoIGlu
IG9yZGVyIHRvIGNoZWNrIHRoZSByZXBseSBvcHRpb24KPiAoZW5hYmxlZC9kaXNhYmxlZCkgYmVm
b3JlIHRyeWluZyB0byByZXBseSB0byB0aGlzIGNvbW1hbmQuIElmIHRoZSBjb21tYW5kCj4gcmVw
bHkgaXMgZGlzYWJsZWQgaXQgd2lsbCByZXR1cm4gYW4gZXJyb3IgdG8gdGhlIGNhbGxlci4gSW4g
dGhlIGVuZCwgdGhlCj4gcmVjZWl2aW5nIHdvcmtlciB3aWxsIGZpbmlzaCBhbmQgdGhlIGludHJv
c3BlY3Rpb24gc29ja2V0IHdpbGwgYmUgY2xvc2VkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFkYWxi
ZXJ0IExhesSDciA8YWxhemFyQGJpdGRlZmVuZGVyLmNvbT4KPiAtLS0KPiAgdmlydC9rdm0va3Zt
aV9tc2cuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3ZpcnQva3ZtL2t2bWlfbXNnLmMgYi92aXJ0L2t2bS9r
dm1pX21zZy5jCj4gaW5kZXggZWE1YzdlMjM2NjlhLi4yMjM3YTZlZDI1ZjYgMTAwNjQ0Cj4gLS0t
IGEvdmlydC9rdm0va3ZtaV9tc2cuYwo+ICsrKyBiL3ZpcnQva3ZtL2t2bWlfbXNnLmMKPiBAQCAt
MTY5LDcgKzE2OSw3IEBAIHN0YXRpYyBpbnQgaGFuZGxlX2dldF92ZXJzaW9uKHN0cnVjdCBrdm1p
ICppa3ZtLAo+ICAJbWVtc2V0KCZycGwsIDAsIHNpemVvZihycGwpKTsKPiAgCXJwbC52ZXJzaW9u
ID0gS1ZNSV9WRVJTSU9OOwo+ICAKPiAtCXJldHVybiBrdm1pX21zZ192bV9yZXBseShpa3ZtLCBt
c2csIDAsICZycGwsIHNpemVvZihycGwpKTsKPiArCXJldHVybiBrdm1pX21zZ192bV9tYXliZV9y
ZXBseShpa3ZtLCBtc2csIDAsICZycGwsIHNpemVvZihycGwpKTsKPiAgfQo+ICAKPiAgc3RhdGlj
IGJvb2wgaXNfY29tbWFuZF9hbGxvd2VkKHN0cnVjdCBrdm1pICppa3ZtLCBpbnQgaWQpCj4gCgpH
byBhaGVhZCBhbmQgc3F1YXNoIHRoaXMgaW4gdGhlIHByZXZpb3VzIHBhdGNoLgoKUGFvbG8KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRp
b24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3Jn
Cmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1
YWxpemF0aW9u
