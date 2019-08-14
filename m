Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF788D0D0
	for <lists.virtualization@lfdr.de>; Wed, 14 Aug 2019 12:38:02 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6F253FD9;
	Wed, 14 Aug 2019 10:37:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id F09CAAD1
	for <virtualization@lists.linux-foundation.org>;
	Wed, 14 Aug 2019 10:37:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 73FED711
	for <virtualization@lists.linux-foundation.org>;
	Wed, 14 Aug 2019 10:37:54 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id p17so110584880wrf.11
	for <virtualization@lists.linux-foundation.org>;
	Wed, 14 Aug 2019 03:37:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=oVgEV1g/UPelVsZcKcw9nOSje8rWLBWULtBtVoDSjso=;
	b=KlrZRoeWzWeWUQT0RFkroBYwf2NobszWCztD+boBdTyniTCpFF52P4dTOAvmqeFoMt
	YuueDG+UFC4FlInpAjzdO3Qn6LN/7iq0/tCy/vHXVmq0g+t3+ZXr5S/m0zdGjvARYRmb
	BO+oWei8yaXN5JEHsd0IlGtayNt+LuGhccb+WqsSpxP0jd7UzNqszIdeOiEYjtTpbf9i
	A/q+Wo2WAXKflM0FtZLzbavP3ZCX6wxJ/teIrkmEjQbbM8jisPShBLG2giI3jU0qksE6
	7oc+tcsGuJmCe8oXqBZ8/oioZlkW5N+gmrnoryzfJ1EZYe17aR1Saft7agRqA7z76h/+
	ajsw==
X-Gm-Message-State: APjAAAU7sbFNiY5X+4Jsf2Wom2aXolH4aPpdPj1MjJJDZo7l3nDaC0Ax
	wLdQcTHmD+gyj6prs2ExiHbdog==
X-Google-Smtp-Source: APXvYqxPmIpqR9ZiKdjUNFmTa5cEt4XtlN46WXuRKyGyJO3GD/9oZYwpSywYiNiWytLJB09hSTpO/w==
X-Received: by 2002:adf:ed4a:: with SMTP id u10mr55236024wro.284.1565779072995;
	Wed, 14 Aug 2019 03:37:52 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:2cae:66cd:dd43:92d9?
	([2001:b07:6468:f312:2cae:66cd:dd43:92d9])
	by smtp.gmail.com with ESMTPSA id
	a17sm2983732wmm.47.2019.08.14.03.37.51
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Aug 2019 03:37:52 -0700 (PDT)
Subject: Re: [RFC PATCH v6 01/92] kvm: introduce KVMI (VM introspection
	subsystem)
To: =?UTF-8?Q?Adalbert_Laz=c4=83r?= <alazar@bitdefender.com>,
	Sean Christopherson <sean.j.christopherson@intel.com>
References: <20190809160047.8319-1-alazar@bitdefender.com>
	<20190809160047.8319-2-alazar@bitdefender.com>
	<20190812202030.GB1437@linux.intel.com>
	<5d52a5ae.1c69fb81.5c260.1573SMTPIN_ADDED_BROKEN@mx.google.com>
	<5fa6bd89-9d02-22cd-24a8-479abaa4f788@redhat.com>
	<20190813150128.GB13991@linux.intel.com>
	<5d53d8d1.1c69fb81.7d32.0bedSMTPIN_ADDED_BROKEN@mx.google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <e00a35b2-74ca-41b8-77a0-2cd37f55a8b6@redhat.com>
Date: Wed, 14 Aug 2019 12:37:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5d53d8d1.1c69fb81.7d32.0bedSMTPIN_ADDED_BROKEN@mx.google.com>
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
	Zhang@vger.kernel.org, virtualization@lists.linux-foundation.org,
	linux-mm@kvack.org, Patrick Colp <patrick.colp@oracle.com>,
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

T24gMTQvMDgvMTkgMTE6NDgsIEFkYWxiZXJ0IExhesSDciB3cm90ZToKPj4gV2h5IGRvZXMgY2xv
c2luZyB0aGUgc29ja2V0IHJlcXVpcmUgZGVzdHJveWluZyB0aGUga3ZtaSBvYmplY3Q/ICBFLmcu
IGNhbgo+PiBpdCBiZSBtYXJrZWQgYXMgZGVmdW5jdCBvciB3aGF0ZXZlciBhbmQgb25seSBmdWxs
eSByZW1vdmVkIG9uIGEgc3luY2hyb25vdXMKPj4gdW5ob29rIGZyb20gdXNlcnNwYWNlPyAgUmUt
aG9va2luZyBjb3VsZCBlaXRoZXIgcmVxdWlyZSBzYWlkIHVuaG9vaywgb3IKPj4gbWF5YmUgcmV1
c2UgdGhlIGV4aXN0aW5nIGt2bWkgb2JqZWN0IHdpdGggYSBuZXcgc29ja2V0Lgo+IFdpbGwgaXQg
YmUgYmV0dGVyIHRvIGhhdmUgdGhlIGZvbGxvd2luZyBpb2N0bHM/Cj4gCj4gICAtIGhvb2sgKGFs
bG9jIGt2bWkgYW5kIGt2bWlfdmNwdSBzdHJ1Y3RzKQo+ICAgLSBub3RpZnlfaW1taW5lbnRfdW5o
b29rIChzZW5kIHRoZSBLVk1JX0VWRU5UX1VOSE9PSyBldmVudCkKPiAgIC0gdW5ob29rIChmcmVl
IGt2bWkgYW5kIGt2bWlfdmNwdSBzdHJ1Y3RzKQoKWWVhaCwgdGhhdCBpcyBuaWNlIGFsc28gYmVj
YXVzZSBpdCBsZWF2ZXMgdGhlIHRpbWVvdXQgcG9saWN5IHRvCnVzZXJzcGFjZS4gIChCVFcsIHBs
ZWFzZSBjaGFuZ2UgcmVmZXJlbmNlcyB0byBRRU1VIHRvICJ1c2Vyc3BhY2UiKS4KClBhb2xvCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0
aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0
dWFsaXphdGlvbg==
