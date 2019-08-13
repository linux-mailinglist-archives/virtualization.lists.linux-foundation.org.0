Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6627A8B36D
	for <lists.virtualization@lfdr.de>; Tue, 13 Aug 2019 11:11:21 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DCD6CACC;
	Tue, 13 Aug 2019 09:11:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CEE82ACC
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 09:11:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 467F3CF
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 09:11:14 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id n9so107156623wru.0
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 02:11:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ZLfQUKMyIX+ZNqu061niPgB5QJHAS9O4tJDY0/iOqpI=;
	b=O8T0SWHDw7Mnnyk8q1+N2hVd51lFI9WXlhWfVaK+Px1MApxS/BQjbyhH56FBHpmdzM
	WpS5RWOWavV2ObcM6W0vehepSUqX2wIw/cBz3EtAi3n1lLN4LRw0qfrvbHt+8sei+QUr
	8TNnMR5M387+F0oCVjUiwHfG9dn68732d7QqqyvOvdG1lcYcQYZBctXULgfCbM+m0srU
	IibOHSN3BiuKl7K0eLy6/U3zCzwYh2ZevMtVVadL4YV0pIH+RpSEnqO5vaeqvAl7xusB
	WFkYPo6eOhbefhdzKFC7uufElIjt1yaA1zXFksUQ+dDeUrMp6YjbxpZ+9Ni7n2Gf+Uxc
	tr+g==
X-Gm-Message-State: APjAAAXcNn4Hm5jTpmyGJBZ5FSjiJ2w9qODQN2qKwmQ0zk0Gz8J4dofX
	tbYScbC2jbAcCyvTy7YOXt2DrQ==
X-Google-Smtp-Source: APXvYqy7VmidnHameXLpWAVfWnBv9skdiBmqhQxOPN9tWRfiYQG3zhEjwfDUfIpUfac5Z2c42ezw5A==
X-Received: by 2002:a5d:4f01:: with SMTP id c1mr20624055wru.43.1565687472832; 
	Tue, 13 Aug 2019 02:11:12 -0700 (PDT)
Received: from [192.168.10.150] ([93.56.166.5])
	by smtp.gmail.com with ESMTPSA id x24sm898079wmh.5.2019.08.13.02.11.11
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Aug 2019 02:11:12 -0700 (PDT)
Subject: Re: [RFC PATCH v6 01/92] kvm: introduce KVMI (VM introspection
	subsystem)
To: Sean Christopherson <sean.j.christopherson@intel.com>,
	=?UTF-8?Q?Adalbert_Laz=c4=83r?= <alazar@bitdefender.com>
References: <20190809160047.8319-1-alazar@bitdefender.com>
	<20190809160047.8319-2-alazar@bitdefender.com>
	<20190812202030.GB1437@linux.intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <81f6c33e-6851-8272-bd8e-7b0bf9ef1ff9@redhat.com>
Date: Tue, 13 Aug 2019 11:11:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190812202030.GB1437@linux.intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On 12/08/19 22:20, Sean Christopherson wrote:
> The refcounting approach seems a bit backwards, and AFAICT is driven by
> implementing unhook via a message, which also seems backwards.  I assume
> hook and unhook are relatively rare events and not performance critical,
> so make those the restricted/slow flows, e.g. force userspace to quiesce
> the VM by making unhook() mutually exclusive with every vcpu ioctl() and
> maybe anything that takes kvm->lock. 

The reason for the unhook event, as far as I understand, is because the
introspection appliance can poke int3 into the guest and needs an
opportunity to undo that.

I don't have a big problem with that and the refcounting, at least for
this first iteration---it can be tackled later, once the general event
loop is simplified---however I agree with the other comments that Sean
made.  Fortunately it should not be hard to apply them to the whole
patchset with search and replace on the patches themselves.

Paolo
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
