Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E78CAF5D
	for <lists.virtualization@lfdr.de>; Thu,  3 Oct 2019 21:39:06 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 363AB14C2;
	Thu,  3 Oct 2019 19:38:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 21FF014BA
	for <virtualization@lists.linux-foundation.org>;
	Thu,  3 Oct 2019 19:38:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C064F1FB
	for <virtualization@lists.linux-foundation.org>;
	Thu,  3 Oct 2019 19:38:39 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
	[209.85.221.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 18D383D966
	for <virtualization@lists.linux-foundation.org>;
	Thu,  3 Oct 2019 19:38:39 +0000 (UTC)
Received: by mail-wr1-f70.google.com with SMTP id t11so1562403wrq.19
	for <virtualization@lists.linux-foundation.org>;
	Thu, 03 Oct 2019 12:38:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7QLgfjpHoSlZ+ECWPNFBD+JW0vOaubyrwbW7qiEpfTs=;
	b=hSGC4hOisQYAhXzclZUnhd6OVLqbknTz/IWlHsJtKL9hCboLHySAh0V6z05rfnEnK1
	1NYSf6y1r1k9HsQYx2oH2rqQTEKqedeL0WaIOFycz6JIWPNMRohmrY6Jsfgacy382/W7
	vy89mTh34BX04FQNJnZ5g47hL/NkAvcLxI9L2dCm+vrYSkEkjnHKvCdEW7tf+b+NSllH
	TweneBz6jridVjQHBcjo11+Vqn4QuMY9/iXdudoqUXfJQpfy5m/pRh60BDS3f7Hn/f98
	d76aNSoe63X0pj/u3GNu+OofzBfWbJBUVx0XzGNw+YQwFbY7dD+zCm7UeEtQCzCjVPi/
	ytLg==
X-Gm-Message-State: APjAAAUbf1VRlCWB8ionn7uO08wWFsqAFkC0oKRujxJmuB3jH7G4Sdwq
	fV6oHtXSwqkiAmZLYvnnE/bDK7LSclEt2NOLpbLyx3q922gHNi3b8sdnhvI+6u3avSieSQMYCG4
	YjjQULsU9rxllablCDgKbB7BkKMUKidsdYmqsyY7izQ==
X-Received: by 2002:adf:e28e:: with SMTP id v14mr8548949wri.184.1570131517629; 
	Thu, 03 Oct 2019 12:38:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwaEc996x92Bjfkrt/7/Bp3ePgLBVpbOA1h0uSvOWcidOkSjdp4RwK4EnTkpGFal4Tmi9DFQw==
X-Received: by 2002:adf:e28e:: with SMTP id v14mr8548930wri.184.1570131517306; 
	Thu, 03 Oct 2019 12:38:37 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:e56d:fbdf:8b79:c79c?
	([2001:b07:6468:f312:e56d:fbdf:8b79:c79c])
	by smtp.gmail.com with ESMTPSA id
	q124sm5331957wma.5.2019.10.03.12.38.35
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 03 Oct 2019 12:38:36 -0700 (PDT)
Subject: Re: DANGER WILL ROBINSON, DANGER
To: Jerome Glisse <jglisse@redhat.com>,
	Mircea CIRJALIU - MELIU <mcirjaliu@bitdefender.com>
References: <DB7PR02MB3979D1143909423F8767ACE2BBB60@DB7PR02MB3979.eurprd02.prod.outlook.com>
	<20191002192714.GA5020@redhat.com>
	<ab461f02-e6cd-de0f-b6ce-0f5a95798eaa@redhat.com>
	<20191002141542.GA5669@redhat.com>
	<f26710a4-424f-730c-a676-901bae451409@redhat.com>
	<20191002170429.GA8189@redhat.com>
	<dd0ca0d3-f502-78a1-933a-7e1b5fb90baa@redhat.com>
	<20191003154233.GA4421@redhat.com>
	<d62a6720-e069-4e03-6a3a-798c020786f7@redhat.com>
	<DB7PR02MB39796440DC81A5B53E86F029BB9F0@DB7PR02MB3979.eurprd02.prod.outlook.com>
	<20191003183108.GA3557@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <afe2cf69-5c2c-95af-88ce-f3814fece2e2@redhat.com>
Date: Thu, 3 Oct 2019 21:38:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191003183108.GA3557@redhat.com>
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

On 03/10/19 20:31, Jerome Glisse wrote:
> So in summary, the source qemu process has anonymous vma (regular
> libc malloc for instance). The introspector qemu process which
> mirror the the source qemu use mmap on /dev/kvm (assuming you can
> reuse the kvm device file for this otherwise you can introduce a
> new kvm device file). 

It should be a new device, something like /dev/kvmmem.  BitDefender's
RFC patches already have the right userspace API, that was not an issue.

Paolo
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
