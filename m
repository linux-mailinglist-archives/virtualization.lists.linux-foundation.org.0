Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 250C28B3F4
	for <lists.virtualization@lfdr.de>; Tue, 13 Aug 2019 11:18:34 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B6735CBA;
	Tue, 13 Aug 2019 09:18:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BB1C1B3E
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 09:18:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 391AB8A8
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 09:18:27 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id 31so107100077wrm.1
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 02:18:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=IZRmvHQ/S4hTPY+RjwdslhJjoJMmuhgf33bqPBS5Vo0=;
	b=ZPidigUiz8ZU9UKeT1yHjnIsMMUCKfn8MPK/+wzrqgXS86TTUOXp0KLZcw6jN+cnTV
	8zVWT7ylfCmfLdu8HhGM2EkO+Myvn52z2snHhR01F8QqgYJkcxqWKsAGElGMuWX8qeLM
	5crJX+r1GoZU9G49ra62/dRSU8BzLG0h0NuuUWSnYyGGLOjY5WNhL3AhvjcPk/uCuw9s
	bH+OjPVyIZxQBuFLoMWWpH0GGpZLZcSlX/XrrJFMfbJXPt+MxXxViRd2hM/yBHOc3pNq
	AEchcpxQfEiNQl4upF9u5U8wjS5mUzYlExltYdS2v4qb4rBfGvk49GpNIuBjnD6C3YIm
	hPvA==
X-Gm-Message-State: APjAAAUAliChLmGnGArrg/jgpaHFECurHHYIb0Nwun9/W3YhvOpTtXhO
	eya6St9iqGtODRjzK64pm3sIDg==
X-Google-Smtp-Source: APXvYqwtQnCM7sq50W3r0VMXnUEHukyuzwOv/MX6D9s31ZjWhM+QEV2IF+RJkpJzTPaoAknQIFzUOA==
X-Received: by 2002:adf:dbcb:: with SMTP id e11mr4705392wrj.272.1565687905800; 
	Tue, 13 Aug 2019 02:18:25 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5d12:7fa9:fb2d:7edb?
	([2001:b07:6468:f312:5d12:7fa9:fb2d:7edb])
	by smtp.gmail.com with ESMTPSA id w15sm936813wmi.19.2019.08.13.02.18.24
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Aug 2019 02:18:25 -0700 (PDT)
Subject: Re: [RFC PATCH v6 76/92] kvm: x86: disable EPT A/D bits if
	introspection is present
To: =?UTF-8?Q?Adalbert_Laz=c4=83r?= <alazar@bitdefender.com>,
	kvm@vger.kernel.org
References: <20190809160047.8319-1-alazar@bitdefender.com>
	<20190809160047.8319-77-alazar@bitdefender.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <9f8b31c5-2252-ddc5-2371-9c0959ac5a18@redhat.com>
Date: Tue, 13 Aug 2019 11:18:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809160047.8319-77-alazar@bitdefender.com>
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

T24gMDkvMDgvMTkgMTg6MDAsIEFkYWxiZXJ0IExhesSDciB3cm90ZToKPiBTaWduZWQtb2ZmLWJ5
OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBiaXRkZWZlbmRlci5jb20+Cj4gLS0tCj4gIGFyY2gv
eDg2L2t2bS92bXgvdm14LmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0vdm14L3ZteC5j
IGIvYXJjaC94ODYva3ZtL3ZteC92bXguYwo+IGluZGV4IGRjNjQ4YmE0N2RmMy4uMTUyYzU4YjYz
ZjY5IDEwMDY0NAo+IC0tLSBhL2FyY2gveDg2L2t2bS92bXgvdm14LmMKPiArKysgYi9hcmNoL3g4
Ni9rdm0vdm14L3ZteC5jCj4gQEAgLTc3MTgsNyArNzcxOCw3IEBAIHN0YXRpYyBfX2luaXQgaW50
IGhhcmR3YXJlX3NldHVwKHZvaWQpCj4gIAkgICAgIWNwdV9oYXNfdm14X2ludmVwdF9nbG9iYWwo
KSkKPiAgCQllbmFibGVfZXB0ID0gMDsKPiAgCj4gLQlpZiAoIWNwdV9oYXNfdm14X2VwdF9hZF9i
aXRzKCkgfHwgIWVuYWJsZV9lcHQpCj4gKwlpZiAoIWNwdV9oYXNfdm14X2VwdF9hZF9iaXRzKCkg
fHwgIWVuYWJsZV9lcHQgfHwga3ZtaV9pc19wcmVzZW50KCkpCj4gIAkJZW5hYmxlX2VwdF9hZF9i
aXRzID0gMDsKPiAgCj4gIAlpZiAoIWNwdV9oYXNfdm14X3VucmVzdHJpY3RlZF9ndWVzdCgpIHx8
ICFlbmFibGVfZXB0KQo+IAoKV2h5PwoKUGFvbG8KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxp
emF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3Vu
ZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
