Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C05F68B31A
	for <lists.virtualization@lfdr.de>; Tue, 13 Aug 2019 10:55:32 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DF029C90;
	Tue, 13 Aug 2019 08:55:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3DE8FB09
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 08:55:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 91C6712F
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 08:55:25 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id p74so738194wme.4
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 01:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=sPUyfB4muaIr59fd4usHXqxooogTzwXwDuPC1t7ce04=;
	b=nDEgeCldxqvmuO8e7frsR85RIXQ9S0YlzvPSSrDTLNShd9QXiLhIWfb0N79hhICySs
	f2uUHSUxNSlS6kQ00CkjPTtpTPfhP7wictf28xXPLga1A7H1S0wFm+izUfn9Gfs2wSpo
	QUQ49PtL/hslTKrFbJF9CcPIssr+oVm/T1C9F3CABsZexq2nLBgAdmVYveuaS/3FQqhx
	k1Nxa6pKDsf5bZ81OdYALH5XCy67xYT69ebFZTpOIC12huZgf86MeduaLzi+Hl2yT39U
	Ebuz27dNfisOxSt3YGGZXHrgZPV95RNppPvg9BNhEhfsKPFDog7UiGsU+6oN7AA/HMJ+
	Zk+g==
X-Gm-Message-State: APjAAAWjpLicTGyAdP7W6srUaiJN3bBFXszkTt4+JidOKKJH4pNsej4V
	mwnMdHmO0bL4oo1hho6sWCQrfg==
X-Google-Smtp-Source: APXvYqxbrJjpte7v8LCdT4TY1BMezIoEu72MDVQxtXaSnj9GyHSbv3Go1giiz3C/PIGfATdRGc3mYg==
X-Received: by 2002:a05:600c:2292:: with SMTP id
	18mr1851704wmf.156.1565686524175; 
	Tue, 13 Aug 2019 01:55:24 -0700 (PDT)
Received: from [192.168.10.150] ([93.56.166.5])
	by smtp.gmail.com with ESMTPSA id
	n14sm212546507wra.75.2019.08.13.01.55.22
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Aug 2019 01:55:23 -0700 (PDT)
Subject: Re: [RFC PATCH v6 16/92] kvm: introspection: handle events and event
	replies
To: =?UTF-8?Q?Adalbert_Laz=c4=83r?= <alazar@bitdefender.com>,
	kvm@vger.kernel.org
References: <20190809160047.8319-1-alazar@bitdefender.com>
	<20190809160047.8319-17-alazar@bitdefender.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <08325b3b-3af9-382b-7c0f-8410e8fcb545@redhat.com>
Date: Tue, 13 Aug 2019 10:55:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809160047.8319-17-alazar@bitdefender.com>
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

T24gMDkvMDgvMTkgMTc6NTksIEFkYWxiZXJ0IExhesSDciB3cm90ZToKPiAKPiArCQkJIHJlcGx5
LT5wYWRkaW5nMik7Cj4gKwo+ICsJaXZjcHUtPnJlcGx5X3dhaXRpbmcgPSBmYWxzZTsKPiArCXJl
dHVybiBleHBlY3RlZC0+ZXJyb3I7Cj4gK30KPiArCj4gIC8qCgpJcyB0aGlzIG1pc3NpbmcgYSB3
YWtldXA/Cgo+ICAKPiArc3RhdGljIGJvb2wgbmVlZF90b193YWl0KHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSkKPiArewo+ICsJc3RydWN0IGt2bWlfdmNwdSAqaXZjcHUgPSBJVkNQVSh2Y3B1KTsKPiAr
Cj4gKwlyZXR1cm4gaXZjcHUtPnJlcGx5X3dhaXRpbmc7Cj4gK30KPiArCgpEbyB5b3UgYWN0dWFs
bHkgbmVlZCB0aGlzIGZ1bmN0aW9uPyAgSXQgc2VlbXMgdG8gbWUgdGhhdCBldmVyeXdoZXJlIHlv
dQpjYWxsIGl0IHlvdSBhbHJlYWR5IGhhdmUgYW4gaXZjcHUsIHNvIHlvdSBjYW4ganVzdCBhY2Nl
c3MgdGhlIGZpZWxkLgoKQWxzbywgInJlcGx5X3dhaXRpbmciIG1lYW5zICJ0aGVyZSBpcyBhIHJl
cGx5IHRoYXQgaXMgd2FpdGluZyIuICBXaGF0CnlvdSBtZWFuIGlzICJ3YWl0aW5nX2Zvcl9yZXBs
eSIuCgpUaGUgb3ZlcmFsbCBzdHJ1Y3R1cmUgb2YgdGhlIGpvYnMgY29kZSBpcyBjb25mdXNpbmcu
ICBUaGUgc2FtZSBmdW5jdGlvbgprdm1fcnVuX2pvYnNfYW5kX3dhaXQgaXMgYW4gaW5maW5pdGUg
bG9vcCBiZWZvcmUgYW5kIGdldHMgYSAiYnJlYWsiCmxhdGVyLiAgSXQgaXMgYWxzbyBub3QgY2xl
YXIgd2h5IGt2bWlfam9iX3dhaXQgaXMgY2FsbGVkIHRocm91Z2ggYSBqb2IuCiBDYW4geW91IGhh
dmUgaW5zdGVhZCBqdXN0IGt2bV9ydW5fam9icyBpbiBLVk1fUkVRX0lOVFJPU1BFQ1RJT04sIGFu
ZApzb21ldGhpbmcgbGlrZSB0aGlzIGluc3RlYWQgd2hlbiBzZW5kaW5nIGFuIGV2ZW50OgoKaW50
IGt2bWlfd2FpdF9mb3JfcmVwbHkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQp7CglzdHJ1Y3Qga3Zt
aV92Y3B1ICppdmNwdSA9IElWQ1BVKHZjcHUpOwoKCXdoaWxlIChpdmNwdS0+d2FpdGluZ19mb3Jf
cmVwbHkpIHsKCQlrdm1pX3J1bl9qb2JzKHZjcHUpOwoKCQllcnIgPSBzd2FpdF9ldmVudF9raWxs
YWJsZSgqd3EsCgkJCQkhaXZjcHUtPndhaXRpbmdfZm9yX3JlcGx5IHx8CgkJCQkhbGlzdF9lbXB0
eSgmaXZjcHUtPmpvYl9saXN0KSk7CgoJCWlmIChlcnIpCgkJCXJldHVybiAtRUlOVFI7Cgl9CgoJ
cmV0dXJuIDA7Cn0KCj8KClBhb2xvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBs
aXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5v
cmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
