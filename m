Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F4B8B416
	for <lists.virtualization@lfdr.de>; Tue, 13 Aug 2019 11:29:20 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3BA8DC9E;
	Tue, 13 Aug 2019 09:29:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AAB96B09
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 09:29:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1B62412F
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 09:29:12 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p77so647102wme.0
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 02:29:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=HlAEpqymIE/2aXmWh9O2C6f1zWhZyF+vIZxr8hLy7E8=;
	b=mq6UR7vZjr4oUmRIRbsB+pcirLYADhoOuutePDOG3dC6LXILSoX4EA8opiHZP9rFXt
	akFUf9s7D3B0lIjy2osZeTVB2D/h5Mogh5cXOxSKQMCyWtHty4zFTsJSV9VBxmjmD9Z4
	OWg1eifiFYnO9IDHLwf9WKpp0JhOfly9XKSoNDRYhTqAI6AmOE0rdqaH8BOFlpJ+aXI6
	eH+6j4SYMPIFV/soan17+0Pru/xYA8MnF0woTgwd9cMW9xqIQP4scEqOdg1bNO10j+2I
	prRWMZxS/LgpQQ5XFUUq0mvbk1Vl81H98DgC+vEsudLjDNrTBL3EeBzSzEmGtNV08w4Z
	7VYA==
X-Gm-Message-State: APjAAAWrMJaT/K5VYirfCcok4qkjYlCqPccL46cCCZfGMxn3IBWacXTz
	xE5cPJfywLM5LqfguAZXfPua+Q==
X-Google-Smtp-Source: APXvYqzrOiKUATXICk0r/wqqOqYzdUlD6b5RE1HxjJCFGhp5IL3oELH2ehl1knzxc0AKbs6tiQAFDw==
X-Received: by 2002:a7b:c198:: with SMTP id y24mr2019539wmi.131.1565688550614; 
	Tue, 13 Aug 2019 02:29:10 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5d12:7fa9:fb2d:7edb?
	([2001:b07:6468:f312:5d12:7fa9:fb2d:7edb])
	by smtp.gmail.com with ESMTPSA id
	f134sm1257977wmg.20.2019.08.13.02.29.09
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Aug 2019 02:29:10 -0700 (PDT)
Subject: Re: DANGER WILL ROBINSON, DANGER
To: Matthew Wilcox <willy@infradead.org>,
	=?UTF-8?Q?Adalbert_Laz=c4=83r?= <alazar@bitdefender.com>
References: <20190809160047.8319-1-alazar@bitdefender.com>
	<20190809160047.8319-72-alazar@bitdefender.com>
	<20190809162444.GP5482@bombadil.infradead.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <ae0d274c-96b1-3ac9-67f2-f31fd7bbdcee@redhat.com>
Date: Tue, 13 Aug 2019 11:29:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809162444.GP5482@bombadil.infradead.org>
Content-Language: en-US
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Weijiang Yang <weijiang.yang@intel.com>,
	Yu C <yu.c.zhang@intel.com>, kvm@vger.kernel.org,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	=?UTF-8?Q?Samuel_Laur=c3=a9n?= <samuel.lauren@iki.fi>,
	=?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	Patrick Colp <patrick.colp@oracle.com>,
	Mathieu Tarral <mathieu.tarral@protonmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Zhang@kvack.org,
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

T24gMDkvMDgvMTkgMTg6MjQsIE1hdHRoZXcgV2lsY294IHdyb3RlOgo+IE9uIEZyaSwgQXVnIDA5
LCAyMDE5IGF0IDA3OjAwOjI2UE0gKzAzMDAsIEFkYWxiZXJ0IExhesSDciB3cm90ZToKPj4gKysr
IGIvaW5jbHVkZS9saW51eC9wYWdlLWZsYWdzLmgKPj4gQEAgLTQxNyw4ICs0MTcsMTAgQEAgUEFH
RUZMQUcoSWRsZSwgaWRsZSwgUEZfQU5ZKQo+PiAgICovCj4+ICAjZGVmaW5lIFBBR0VfTUFQUElO
R19BTk9OCTB4MQo+PiAgI2RlZmluZSBQQUdFX01BUFBJTkdfTU9WQUJMRQkweDIKPj4gKyNkZWZp
bmUgUEFHRV9NQVBQSU5HX1JFTU9URQkweDQKPiBVaC4gIEhvdyBkbyB5b3Uga25vdyBwYWdlLT5t
YXBwaW5nIHdvdWxkIG90aGVyd2lzZSBoYXZlIGJpdCAyIGNsZWFyPwo+IFdobydzIGd1YXJhbnRl
ZWluZyB0aGF0Pwo+IAo+IFRoaXMgaXMgYW4gYXdmdWxseSBiaWcgcGF0Y2ggdG8gdGhlIG1lbW9y
eSBtYW5hZ2VtZW50IGNvZGUsIGJ1cmllZCBpbgo+IHRoZSBtaWRkbGUgb2YgYSBnaWdhbnRpYyBz
ZXJpZXMgd2hpY2ggYWxtb3N0IGd1YXJhbnRlZXMgbm9ib2R5IHdvdWxkCj4gbG9vayBhdCBpdC4g
IEkgY2FsbCBzaGVuYW5pZ2Fucy4KCkFyZSB5b3UgY2FsbGluZyBzaGVuYW5pZ2FucyBvbiB0aGUg
cGF0Y2ggc3VibWl0dGVyICh3aGljaCBpcyBncmF0dWl0b3VzKQpvciBvbiB0aGUgS1ZNIG1haW50
YWluZXJzL3Jldmlld2Vycz8KCkl0J3Mgbm90IHRydWUgdGhhdCBub2JvZHkgd291bGQgbG9vayBh
dCBpdC4gIE9mIGNvdXJzZSBubyBvbmUgZnJvbQpsaW51eC1tbSBpcyBnb2luZyB0byBsb29rIGF0
IGl0LCBidXQgdGhlIG1haW50YWluZXIgdGhhdCBsb29rcyBhdCB0aGUKZ2lnYW50aWMgc2VyaWVz
IGlzIHZlcnkgbXVjaCBleHBlY3RlZCB0byBsb29rIGF0IGl0IGFuZCBleHBsYWluIHRvIHRoZQpz
dWJtaXR0ZXIgdGhhdCB0aGlzIHBhdGNoIGlzIHVuYWNjZXB0YWJsZSBhcyBpcy4KCkluIGZhY3Qg
SSBzaG91bGRuJ3QgaGF2ZSB0byB0byBleHBsYWluIHRoaXMgdG8geW91OyB5b3Uga25vdyBiZXR0
ZXIgdGhhbgpiZWxpZXZpbmcgdGhhdCBJIHdvdWxkIHRyeSB0byBzbmVhayBpdCBwYXN0IHRoZSBt
bSBmb2xrcy4gIEkgYW0gcHV6emxlZC4KClBhb2xvCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFs
aXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91
bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
