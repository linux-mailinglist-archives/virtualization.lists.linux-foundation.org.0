Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E578ADDB1
	for <lists.virtualization@lfdr.de>; Mon,  9 Sep 2019 19:00:19 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1528BEC1;
	Mon,  9 Sep 2019 17:00:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 05352DE0
	for <virtualization@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 17:00:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A97DCEC
	for <virtualization@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 17:00:11 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
	[209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1C6DBC04D293
	for <virtualization@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 17:00:11 +0000 (UTC)
Received: by mail-wm1-f72.google.com with SMTP id m6so107652wmf.2
	for <virtualization@lists.linux-foundation.org>;
	Mon, 09 Sep 2019 10:00:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=D0EEdCwjKZAloFiFZzRmxXTgf/1c/anbaaWwH/4atiA=;
	b=BhI4DhBoecs7hzXLmrtfB2GP3z693qyelzeL/gUvlUJH1lAWYcZ/ocuMyxlBb2XplJ
	SH1jEj9XQvuilx+cCODXZavbelEeMttKCX7YzVzTEfcOAoSeQpOCAgjhc8y2gQo3NOQd
	3JQRsasmkQoYN6s5nYHOz+5L7ZeqWMx5tK2sw5nCT+LJnUYdrRMK8KjHk4/oS4IjLUDJ
	KweyrLiL0IWDysaVTMfHwQZ7BBqPEIspE3RJ9DgYPRThvdO9JR9mzi/o2HiZUdnEIlpu
	+v1Aus983bj7VgiOo8c/dI24cLwy3gVDocqUJgllwkM/s1eXOARWMG4ziY6dxARHwtXs
	VfAw==
X-Gm-Message-State: APjAAAVYXXZ/ubS8w7ygPLbAoyq+VzSqR9DO6o3sNgYVVAcCw/AT/dla
	kbDpqpMFERSt3bmFNh8/Z+AndqX+/9tSqWxgo3T2AZDKTqZrolR31dZrFGu93ytNOdZFNSyDw97
	ZMS5lVovoJgJHsd0lCdGJeziUXBpnbDUEPFp6YRUjng==
X-Received: by 2002:a5d:66d2:: with SMTP id k18mr19678354wrw.7.1568048409643; 
	Mon, 09 Sep 2019 10:00:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzXJaVNu/2/fZCHTtIWw35qwKTZd4unUZx6BMsLts8oOV6M65uq4VD5n7+CBECGa01osKa5IQ==
X-Received: by 2002:a5d:66d2:: with SMTP id k18mr19678322wrw.7.1568048409413; 
	Mon, 09 Sep 2019 10:00:09 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:4580:a289:2f55:eec1?
	([2001:b07:6468:f312:4580:a289:2f55:eec1])
	by smtp.gmail.com with ESMTPSA id
	d28sm16924627wrb.95.2019.09.09.10.00.08
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 09 Sep 2019 10:00:08 -0700 (PDT)
Subject: Re: DANGER WILL ROBINSON, DANGER
To: Jerome Glisse <jglisse@redhat.com>,
	Mircea CIRJALIU - MELIU <mcirjaliu@bitdefender.com>
References: <20190809160047.8319-1-alazar@bitdefender.com>
	<20190809160047.8319-72-alazar@bitdefender.com>
	<20190809162444.GP5482@bombadil.infradead.org>
	<1565694095.D172a51.28640.@15f23d3a749365d981e968181cce585d2dcb3ffa>
	<20190815191929.GA9253@redhat.com> <20190815201630.GA25517@redhat.com>
	<VI1PR02MB398411CA9A56081FF4D1248EBBA40@VI1PR02MB3984.eurprd02.prod.outlook.com>
	<20190905180955.GA3251@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <5b0966de-b690-fb7b-5a72-bc7906459168@redhat.com>
Date: Mon, 9 Sep 2019 19:00:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905180955.GA3251@redhat.com>
Content-Language: en-US
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Weijiang Yang <weijiang.yang@intel.com>, Yu C <yu.c.zhang@intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	=?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	=?UTF-8?Q?Samuel_Laur=c3=a9n?= <samuel.lauren@iki.fi>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Matthew Wilcox <willy@infradead.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	=?UTF-8?Q?Adalbert_Laz=c4=83r?= <alazar@bitdefender.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On 05/09/19 20:09, Jerome Glisse wrote:
> Not sure i understand, you are saying that the solution i outline above
> does not work ? If so then i think you are wrong, in the above solution
> the importing process mmap a device file and the resulting vma is then
> populated using insert_pfn() and constantly keep synchronize with the
> target process through mirroring which means that you never have to look
> at the struct page ... you can mirror any kind of memory from the remote
> process.

If insert_pfn in turn calls MMU notifiers for the target VMA (which
would be the KVM MMU notifier), then that would work.  Though I guess it
would be possible to call MMU notifier update callbacks around the call
to insert_pfn.

Paolo
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
