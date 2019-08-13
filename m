Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B43258B2CA
	for <lists.virtualization@lfdr.de>; Tue, 13 Aug 2019 10:44:42 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BDAA4C75;
	Tue, 13 Aug 2019 08:44:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DB6AA72A
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 08:44:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5D6D68D
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 08:44:32 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id z11so5032596wrt.4
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 01:44:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=blKE7hBPEaF3XcD8274I5hmyBZ0ZERzbpulCfit8yl4=;
	b=goH2POoXPYKTyoIwrdPMod2QDG9rV3HO7G1n+DPRiuFcgk6agXzzELvdWDj/8wRiS1
	Zo0osxesiKj7UsKZPMzl5JMNYgxRc42w0YaSG/+Ig6qh5VBDYw3IpfdmNsvcJ9HjZUcZ
	0PCbElAU5HBOfc9MlXrdoRVE1sDf0shko6r8zjv0jJJlEFhkEwx583IjoKfz9EQtM4RE
	lc0Tf+sLgYHV+p7lC/R4c2d8uFFwwYXlpfvRHVbHC4ZU0DQLngXzjkxDYVNqWa7c9L8q
	S0FPees6RPZ6KBfFa38DPcYcW7FVFzuCXSz8600a+t/b/n07B7k5ADUFxsRltA5We+yf
	ziKw==
X-Gm-Message-State: APjAAAUJk5Kp+uHhfFWgqwixD63rj5+m+u6KbGBEREx653tuHI9vlxLO
	+etO5rQY126BtU99x6OYdlTBAQ==
X-Google-Smtp-Source: APXvYqw492WjaEpNzhoTXs/Gd2KelQnitfzJEsecNo1teLr2zcjaHoX7vjpPsoanUMoKR8v6ysgEKw==
X-Received: by 2002:a5d:490a:: with SMTP id x10mr42031164wrq.152.1565685870989;
	Tue, 13 Aug 2019 01:44:30 -0700 (PDT)
Received: from [192.168.10.150] ([93.56.166.5])
	by smtp.gmail.com with ESMTPSA id
	o126sm1401625wmo.1.2019.08.13.01.44.29
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Aug 2019 01:44:30 -0700 (PDT)
Subject: Re: [RFC PATCH v6 02/92] kvm: introspection: add basic ioctls
	(hook/unhook)
To: =?UTF-8?Q?Adalbert_Laz=c4=83r?= <alazar@bitdefender.com>,
	kvm@vger.kernel.org
References: <20190809160047.8319-1-alazar@bitdefender.com>
	<20190809160047.8319-3-alazar@bitdefender.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <58808ef0-57b1-47ac-a115-e1dd64a15b0a@redhat.com>
Date: Tue, 13 Aug 2019 10:44:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809160047.8319-3-alazar@bitdefender.com>
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

T24gMDkvMDgvMTkgMTc6NTksIEFkYWxiZXJ0IExhesSDciB3cm90ZToKPiArc3RhdGljIGludCBr
dm1pX3JlY3Yodm9pZCAqYXJnKQo+ICt7Cj4gKwlzdHJ1Y3Qga3ZtaSAqaWt2bSA9IGFyZzsKPiAr
Cj4gKwlrdm1pX2luZm8oaWt2bSwgIkhvb2tpbmcgVk1cbiIpOwo+ICsKPiArCXdoaWxlIChrdm1p
X21zZ19wcm9jZXNzKGlrdm0pKQo+ICsJCTsKPiArCj4gKwlrdm1pX2luZm8oaWt2bSwgIlVuaG9v
a2luZyBWTVxuIik7Cj4gKwo+ICsJa3ZtaV9lbmRfaW50cm9zcGVjdGlvbihpa3ZtKTsKPiArCj4g
KwlyZXR1cm4gMDsKPiArfQo+ICsKClJlbmFtZSB0aGlzIHRvIGt2bWlfcmVjdl90aHJlYWQgaW5z
dGVhZCwgcGxlYXNlLgoKPiArCj4gKwkvKgo+ICsJICogTWFrZSBzdXJlIGFsbCB0aGUgS1ZNL0tW
TUkgc3RydWN0dXJlcyBhcmUgbGlua2VkIGFuZCBubyBwb2ludGVyCj4gKwkgKiBpcyByZWFkIGFz
IE5VTEwgYWZ0ZXIgdGhlIHJlZmVyZW5jZSBjb3VudCBoYXMgYmVlbiBzZXQuCj4gKwkgKi8KPiAr
CXNtcF9tYl9fYmVmb3JlX2F0b21pYygpOwoKVGhpcyBpcyBhbiBzbXBfd21iKCksIG5vdCBhbiBz
bXBfbWJfX2JlZm9yZV9hdG9taWMoKS4gIEFkZCBhIGNvbW1lbnQKdGhhdCBpdCBwYWlycyB3aXRo
IHRoZSByZWZjb3VudF9pbmNfbm90X3plcm8gaW4ga3ZtaV9nZXQuCgo+ICsJcmVmY291bnRfc2V0
KCZrdm0tPmt2bWlfcmVmLCAxKTsKPiArCgoKPiBAQCAtNTcsOCArMTgzLDI3IEBAIHZvaWQga3Zt
aV9kZXN0cm95X3ZtKHN0cnVjdCBrdm0gKmt2bSkKPiAgCWlmICghaWt2bSkKPiAgCQlyZXR1cm47
Cj4gIAo+ICsJLyogdHJpZ2dlciBzb2NrZXQgc2h1dGRvd24gLSBrdm1pX3JlY3YoKSB3aWxsIHN0
YXJ0IHNodXRkb3duIHByb2Nlc3MgKi8KPiArCWt2bWlfc29ja19zaHV0ZG93bihpa3ZtKTsKPiAr
Cj4gIAlrdm1pX3B1dChrdm0pOwo+ICAKPiAgCS8qIHdhaXQgZm9yIGludHJvc3BlY3Rpb24gcmVz
b3VyY2VzIHRvIGJlIHJlbGVhc2VkICovCj4gIAl3YWl0X2Zvcl9jb21wbGV0aW9uX2tpbGxhYmxl
KCZrdm0tPmt2bWlfY29tcGxldGVkKTsKPiAgfQo+ICsKClRoaXMgYWRkaXRpb24gbWVhbnMgdGhh
dCBrdm1pX2Rlc3Ryb3lfdm0gc2hvdWxkIGhhdmUgY2FsbGVkCmt2bWlfZW5kX2ludHJvc3BlY3Rp
b24gaW5zdGVhZC4gIEluIHBhdGNoIDEsIGt2bWlfZW5kX2ludHJvc3BlY3Rpb24Kc2hvdWxkIGhh
dmUgYmVlbiBqdXN0IGt2bWlfcHV0LCBub3cgdGhpcyBwYXRjaCBjYW4gYWRkIGt2bWlfc29ja19z
aHV0ZG93bi4KClBhb2xvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5s
aW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFp
bG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
