Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FC67F72A
	for <lists.virtualization@lfdr.de>; Fri,  2 Aug 2019 14:46:45 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1D78B12C6;
	Fri,  2 Aug 2019 12:46:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8A45A12BD
	for <virtualization@lists.linux-foundation.org>;
	Fri,  2 Aug 2019 12:46:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 53220712
	for <virtualization@lists.linux-foundation.org>;
	Fri,  2 Aug 2019 12:46:15 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id r6so54672263qkc.0
	for <virtualization@lists.linux-foundation.org>;
	Fri, 02 Aug 2019 05:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=6ql0O82ncHZU71SnaUyYlbcaPGtvlWm+BrLQDkFEDbY=;
	b=MRMA2whmjpLNxlhbDl5mBbGm/wxr+mnLnwdUEiOzNBsQbTy974xui1zcbJXuaVeMgi
	+e6pAPXNKqJ5FLrB5btG3fWEwJOZCNVqx7WhXgNhnlz2EhhnCC/jrtDsn55I0rQrPbEs
	kTXxKo2YuV2bT1/e1Z1A6Wf8qvRURa8Gr3WBc9QO7dijfCQypZgeANqmpaiWdSJoUCtu
	VXKmwcx2rj/qqL+7cWXldCjZ59ch1b87c5iVVd4Ql5AT2hWXZoJ7MKekKjw5eD86xgli
	DTGd7yg7MsSW0a1wLwfpAvBC9sgR49+QmZEGlFoYAgcWlKpxKOv19D6RuAJw4q09e1/M
	Xu1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=6ql0O82ncHZU71SnaUyYlbcaPGtvlWm+BrLQDkFEDbY=;
	b=plpnu/Kc2up+vfcaob4vqX0J0NlFHpHtg8aG1vnpJGKlKDnRhlMFC7wu5VTK6Cl6FA
	lRsrMm5+8zuHxBA6a3YUcjWbXkRQD0ncDeCLbV1BmghEW+mfoRoGJBc1p4KLd/eQRm08
	Y16kAsfjE2m3NZ4PWxhg6yD/ZLMYfRW2yiijHq3xhDY/Jk4BTf/tE4vHFItpwvcWdaF+
	uVZ5ZzfuSwaQKZsJsFhh8+dHCkZ1F1ehufeSyY9u75WysjgjVymHAWPFlX2Z2Y39C/qb
	xEr7kygFLeWIHG930zRNzvRSVsfuxEpH3fKM9QWL6i+ZB13N2S6UwrhsMZEBlG0RYLn+
	8Pow==
X-Gm-Message-State: APjAAAV58I7BVIp1zDWaPDKIez5JK4XOe34mM2C0c/+yxpfCsBykWcw4
	IAstpHwsqpAXWxn/9Pj6ijnkZg==
X-Google-Smtp-Source: APXvYqxtz2vM6y/fN8WSSWPve6vWs8cD8+KUQAMGJTQIxCltGAZYGzTtsZ3uymeGSjZYIgEaLwJYTg==
X-Received: by 2002:a37:bc03:: with SMTP id m3mr89369627qkf.199.1564749974287; 
	Fri, 02 Aug 2019 05:46:14 -0700 (PDT)
Received: from ziepe.ca
	(hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
	[156.34.55.100]) by smtp.gmail.com with ESMTPSA id
	l19sm41561137qtb.6.2019.08.02.05.46.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 02 Aug 2019 05:46:13 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
	(envelope-from <jgg@ziepe.ca>)
	id 1htWwn-0003D2-5A; Fri, 02 Aug 2019 09:46:13 -0300
Date: Fri, 2 Aug 2019 09:46:13 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2 7/9] vhost: do not use RCU to synchronize MMU notifier
	with worker
Message-ID: <20190802124613.GA11245@ziepe.ca>
References: <20190731084655.7024-1-jasowang@redhat.com>
	<20190731084655.7024-8-jasowang@redhat.com>
	<20190731123935.GC3946@ziepe.ca>
	<7555c949-ae6f-f105-6e1d-df21ddae9e4e@redhat.com>
	<20190731193057.GG3946@ziepe.ca>
	<a3bde826-6329-68e4-2826-8a9de4c5bd1e@redhat.com>
	<20190801141512.GB23899@ziepe.ca>
	<42ead87b-1749-4c73-cbe4-29dbeb945041@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <42ead87b-1749-4c73-cbe4-29dbeb945041@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org
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

On Fri, Aug 02, 2019 at 05:40:07PM +0800, Jason Wang wrote:
> > This must be a proper barrier, like a spinlock, mutex, or
> > synchronize_rcu.
> 
> 
> I start with synchronize_rcu() but both you and Michael raise some
> concern.

I've also idly wondered if calling synchronize_rcu() under the various
mm locks is a deadlock situation.

> Then I try spinlock and mutex:
> 
> 1) spinlock: add lots of overhead on datapath, this leads 0 performance
> improvement.

I think the topic here is correctness not performance improvement

> 2) SRCU: full memory barrier requires on srcu_read_lock(), which still leads
> little performance improvement
 
> 3) mutex: a possible issue is need to wait for the page to be swapped in (is
> this unacceptable ?), another issue is that we need hold vq lock during
> range overlap check.

I have a feeling that mmu notififers cannot safely become dependent on
progress of swap without causing deadlock. You probably should avoid
this.

> > And, again, you can't re-invent a spinlock with open coding and get
> > something better.
> 
> So the question is if waiting for swap is considered to be unsuitable for
> MMU notifiers. If not, it would simplify codes. If not, we still need to
> figure out a possible solution.
> 
> Btw, I come up another idea, that is to disable preemption when vhost thread
> need to access the memory. Then register preempt notifier and if vhost
> thread is preempted, we're sure no one will access the memory and can do the
> cleanup.

I think you should use the spinlock so at least the code is obviously
functionally correct and worry about designing some properly justified
performance change after.

Jason
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
