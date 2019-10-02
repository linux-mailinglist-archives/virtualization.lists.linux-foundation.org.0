Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C47C92C7
	for <lists.virtualization@lfdr.de>; Wed,  2 Oct 2019 22:10:34 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 112EC15E2;
	Wed,  2 Oct 2019 20:10:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AEEE615DC
	for <virtualization@lists.linux-foundation.org>;
	Wed,  2 Oct 2019 20:10:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 090F5D3
	for <virtualization@lists.linux-foundation.org>;
	Wed,  2 Oct 2019 20:10:24 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
	[209.85.221.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5049C69089
	for <virtualization@lists.linux-foundation.org>;
	Wed,  2 Oct 2019 20:10:23 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id i15so36038wrx.12
	for <virtualization@lists.linux-foundation.org>;
	Wed, 02 Oct 2019 13:10:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ECzmcjCSbbcsFSzX1mjy2hRL/7INCALmJsVRlbIqA+M=;
	b=SKwY7CVZMrj1wJcO8zAxppwrDxgJIMIb08Ba2fBGwq+kjjNyLqqibq3eyAEJJedDpA
	Z0ZCyQzp0DElH3cd7oihXRjCWn/b/TVOmNFh4Fs5Umo4oMS6SBis0ramBL5VZ0CVfYYL
	A6NHKi/sMGncIMDwHBmHtsRd8j8zu88tTMoGjqZllty79BWgPjMiyiURLdzyop6Bk7Aj
	F3VnLtxHl0di6u6cBXBWVfYIINVWz7uCNCW+++PCJRA48lnj4CWioTEGHuhN5GgsJaHK
	F/6AjGPCYjjwk0vl+wSPqrAbyrHpNgRLuM/f7pLVaM4FWGbjp7/nEWdkH67AtBC7T/ta
	UGBA==
X-Gm-Message-State: APjAAAVyuus/h5Q5Kv2qvz/19DeindjYqCrUMgIxNi217cVEnJC9K7a2
	ozPTW2y+oh/ZEgLDcvdCZyaeAKhYaJ0rvfetRTYKk+G7l6ypSEhId7A7ITKS7RPA3DLdUpC46m7
	HQKDWD1ikfcBtikhxEv9w+95o2il9wCrdNgFpzc4W5w==
X-Received: by 2002:a5d:5185:: with SMTP id k5mr4309037wrv.341.1570047021839; 
	Wed, 02 Oct 2019 13:10:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwCrWt+T8lq0j3jrbvKKSdlpqYZ0reHvLDTlwAHJf9pBgzMN4snDZo/L2kojw/X0EwObK+tMQ==
X-Received: by 2002:a5d:5185:: with SMTP id k5mr4309009wrv.341.1570047021557; 
	Wed, 02 Oct 2019 13:10:21 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:e56d:fbdf:8b79:c79c?
	([2001:b07:6468:f312:e56d:fbdf:8b79:c79c])
	by smtp.gmail.com with ESMTPSA id 94sm642951wrk.92.2019.10.02.13.10.18
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 02 Oct 2019 13:10:20 -0700 (PDT)
Subject: Re: DANGER WILL ROBINSON, DANGER
To: Jerome Glisse <jglisse@redhat.com>
References: <20190815191929.GA9253@redhat.com>
	<20190815201630.GA25517@redhat.com>
	<VI1PR02MB398411CA9A56081FF4D1248EBBA40@VI1PR02MB3984.eurprd02.prod.outlook.com>
	<20190905180955.GA3251@redhat.com>
	<5b0966de-b690-fb7b-5a72-bc7906459168@redhat.com>
	<DB7PR02MB3979D1143909423F8767ACE2BBB60@DB7PR02MB3979.eurprd02.prod.outlook.com>
	<20191002192714.GA5020@redhat.com>
	<ab461f02-e6cd-de0f-b6ce-0f5a95798eaa@redhat.com>
	<20191002141542.GA5669@redhat.com>
	<f26710a4-424f-730c-a676-901bae451409@redhat.com>
	<20191002170429.GA8189@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <dd0ca0d3-f502-78a1-933a-7e1b5fb90baa@redhat.com>
Date: Wed, 2 Oct 2019 22:10:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191002170429.GA8189@redhat.com>
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
	Mircea CIRJALIU - MELIU <mcirjaliu@bitdefender.com>,
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

On 02/10/19 19:04, Jerome Glisse wrote:
> On Wed, Oct 02, 2019 at 06:18:06PM +0200, Paolo Bonzini wrote:
>>>> If the mapping of the source VMA changes, mirroring can update the
>>>> target VMA via insert_pfn.  But what ensures that KVM's MMU notifier
>>>> dismantles its own existing page tables (so that they can be recreated
>>>> with the new mapping from the source VMA)?
>>
>> The KVM inspector process is also (or can be) a QEMU that will have to
>> create its own KVM guest page table.  So if a page in the source VMA is
>> unmapped we want:
>>
>> - the source KVM to invalidate its guest page table (done by the KVM MMU
>> notifier)
>>
>> - the target VMA to be invalidated (easy using mirroring)
>>
>> - the target KVM to invalidate its guest page table, as a result of
>> invalidation of the target VMA
> 
> You can do the target KVM invalidation inside the mirroring invalidation
> code.

Why should the source and target KVMs behave differently?  If the source
invalidates its guest page table via MMU notifiers, so should the target.

The KVM MMU notifier exists so that nothing (including mirroring) needs
to know that there is KVM on the other side.  Any interaction between
KVM page tables and VMAs must be mediated by MMU notifiers, anything
else is unacceptable.

If it is possible to invoke the MMU notifiers around the calls to
insert_pfn, that of course would be perfect.

Thanks,

Paolo
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
