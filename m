Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2C28B2BF
	for <lists.virtualization@lfdr.de>; Tue, 13 Aug 2019 10:44:08 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C5C35C8E;
	Tue, 13 Aug 2019 08:44:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6CAE1C59
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 08:43:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EE8428D
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 08:43:58 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z1so106968879wru.13
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 01:43:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=QrW7dS2ds3pbrdiGP+Xfw3R+Xx+cVjaMWqFORv9YS00=;
	b=B16U28/kb1T6cBMbj1Ky+/xTmtZkl6RfxCOYvnaTYJnOufBGzgOhLmMcQnNKK9pPz7
	e2eYjSSp6/iOZoHebau/WnElGRLcq45s/0Jl59AGd/aNsLe2iNI1uumgXVq/1Mfk7aWZ
	rUqWwamfxu9MLAA+tordQ3JyLPhsONG0z95+LM5zzirtYYs/xTUYPALr5RIplBXbNUTp
	iPl921+PnINolEwcTMIPBlHmdy8cezw/C20sLb0Q07rGezXQfVCDaDm1zR6l87zmHaiC
	dYLTpsED1MyyitUUClI8WlHkOBHT0Hs2XcHyaz+GdAN+Nkz0vlEPf1Rv7cyz1r5gEyVf
	0Xwg==
X-Gm-Message-State: APjAAAW10vRyx9DMQd6Wrc6cdJ2SfqV2Ypl1v7XdAKkWkGq2q7aa6YUZ
	cXJQ6ivqbcSRYbbLe2mOPFZriA==
X-Google-Smtp-Source: APXvYqxuWhc1YpCqxMrLLcWkuQ8VY9K/YArqTGXAb48mAXYstqGvOVyemZekybg0GEAvyY/bBnxajA==
X-Received: by 2002:a5d:4e06:: with SMTP id p6mr21211891wrt.336.1565685837546; 
	Tue, 13 Aug 2019 01:43:57 -0700 (PDT)
Received: from [192.168.10.150] ([93.56.166.5])
	by smtp.gmail.com with ESMTPSA id
	g14sm16821663wrb.38.2019.08.13.01.43.53
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Aug 2019 01:43:56 -0700 (PDT)
Subject: Re: [RFC PATCH v6 13/92] kvm: introspection: make the vCPU wait even
	when its jobs list is empty
To: =?UTF-8?Q?Adalbert_Laz=c4=83r?= <alazar@bitdefender.com>,
	kvm@vger.kernel.org
References: <20190809160047.8319-1-alazar@bitdefender.com>
	<20190809160047.8319-14-alazar@bitdefender.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <c82b509a-86a7-6c2c-943e-f78a02e6efb1@redhat.com>
Date: Tue, 13 Aug 2019 10:43:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809160047.8319-14-alazar@bitdefender.com>
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

T24gMDkvMDgvMTkgMTc6NTksIEFkYWxiZXJ0IExhesSDciB3cm90ZToKPiArdm9pZCBrdm1pX2hh
bmRsZV9yZXF1ZXN0cyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gK3sKPiArCXN0cnVjdCBrdm1p
ICppa3ZtOwo+ICsKPiArCWlrdm0gPSBrdm1pX2dldCh2Y3B1LT5rdm0pOwo+ICsJaWYgKCFpa3Zt
KQo+ICsJCXJldHVybjsKPiArCj4gKwlmb3IgKDs7KSB7Cj4gKwkJaW50IGVyciA9IGt2bWlfcnVu
X2pvYnNfYW5kX3dhaXQodmNwdSk7Cj4gKwo+ICsJCWlmIChlcnIpCj4gKwkJCWJyZWFrOwo+ICsJ
fQo+ICsKPiArCWt2bWlfcHV0KHZjcHUtPmt2bSk7Cj4gK30KPiArCgpVc2luZyBrdm1pX3J1bl9q
b2JzX2FuZF93YWl0IGZyb20gdHdvIHBsYWNlcyAoaGVyZSBhbmQga3ZtaV9zZW5kX2V2ZW50KQpp
cyB2ZXJ5IGNvbmZ1c2luZy4gIERvZXMga3ZtaV9oYW5kbGVfcmVxdWVzdHMgbmVlZCB0byBkbyB0
aGlzLCBvciBjYW4gaXQKanVzdCB1c2Uga3ZtaV9ydW5fam9icz8KClBhb2xvCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxp
bmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlv
bg==
