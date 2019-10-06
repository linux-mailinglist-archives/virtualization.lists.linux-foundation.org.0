Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7ABCD1C9
	for <lists.virtualization@lfdr.de>; Sun,  6 Oct 2019 13:49:02 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id AAB0FB09;
	Sun,  6 Oct 2019 11:48:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7180EACC
	for <virtualization@lists.linux-foundation.org>;
	Sun,  6 Oct 2019 11:48:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1F3DE712
	for <virtualization@lists.linux-foundation.org>;
	Sun,  6 Oct 2019 11:48:53 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
	[209.85.160.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 46724859FC
	for <virtualization@lists.linux-foundation.org>;
	Sun,  6 Oct 2019 11:48:52 +0000 (UTC)
Received: by mail-qt1-f199.google.com with SMTP id c8so12142062qtd.20
	for <virtualization@lists.linux-foundation.org>;
	Sun, 06 Oct 2019 04:48:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=sdl37lqjX+SFzLfIthy2RyG7jlUK9awvDpOf+en7/LQ=;
	b=TGxJ9WDetS8HQuQPpZzhUKQd83ks7sPMbWQisyZQy6FQfIzjObdphiFnVYArKS34DV
	hp2hYR4Lc/+H8Dw6fZmm/BIC8FhEUSBZmrgoEeL73O5bTAdBufRpIbGezaJZp10JVeHA
	+4xEmdQtubUcTBQT+NzboQGyJm1jTgb8y7cmxq0WFzu3O+Ko7tT/sDI4zxKm270q12qV
	3ywPKPQeEDDfJC2XbYUAwMb4OzfFmeHo0Iv9EJkRTKFcZe1PUovnVUm/Ykf2nqpJCF5P
	RIFgcIPd3/KGxriAbOjnTx3JVltUfkVlQ8kaki9a74SWcpx4gotLaPGvTeQle6v8GeNJ
	q/Zw==
X-Gm-Message-State: APjAAAUDjIXAyG3PG5L0W2RQDyBN7FpzyQ+VijIws1oO2mN/i18RZmqh
	cFROq+PXwUcDrSEvlnD5ptGi7HB+1vcMm04EX6QhA8tQwCjvZW27ve+E2mtbvNXMWIJwrDRF5bg
	5QyAtsFl8jrJBTup0Lkbn1Q5evPYBuxSyc+YLRuoE7w==
X-Received: by 2002:a37:4c14:: with SMTP id z20mr19478458qka.296.1570362531628;
	Sun, 06 Oct 2019 04:48:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwfyp2piM8fXqN43+imXIBnkw3kDMGJe0E4btdMYgzSc+WjX/cHK+JrvxeHCTSf3pCHbvGShQ==
X-Received: by 2002:a37:4c14:: with SMTP id z20mr19478447qka.296.1570362531373;
	Sun, 06 Oct 2019 04:48:51 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
	by smtp.gmail.com with ESMTPSA id
	s23sm8168394qte.72.2019.10.06.04.48.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 06 Oct 2019 04:48:50 -0700 (PDT)
Date: Sun, 6 Oct 2019 07:48:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: VIRTIO_BALLOON_F_FREE_PAGE_HINT
Message-ID: <20191006073919-mutt-send-email-mst@kernel.org>
References: <5D7EE856.2080602@intel.com>
	<09257686-90df-5c31-c35f-9d16fc77fee1@redhat.com>
	<CAJuQAmpQV26kb9vTyoW-Q7PsD0SOfX+otkiQZAks1L6k7rgdig@mail.gmail.com>
	<20191003142854-mutt-send-email-mst@kernel.org>
	<CAJuQAmrCiPsofYpDvm8=i32d9c9yCmKpJRBSRFkeubP_2=XKtw@mail.gmail.com>
	<0df87f00-5102-973b-3a7a-735e44f4ac3f@redhat.com>
	<20191004043446-mutt-send-email-mst@kernel.org>
	<30c6feba-7037-b52f-3ef4-4a5c50be0aff@redhat.com>
	<CAJuQAmpwQ4guGtHTTWC60EAYBuJ264d6CgWmWEHSnb8-CRtWBw@mail.gmail.com>
	<859eada9-d3e2-8f28-ebd6-a8cb562dbff5@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <859eada9-d3e2-8f28-ebd6-a8cb562dbff5@redhat.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tyler Sanderson <tysand@google.com>,
	virtualization@lists.linux-foundation.org
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

On Sun, Oct 06, 2019 at 10:30:40AM +0200, David Hildenbrand wrote:
> Please note the "use outside of a testing or debugging environment is
> not recommended". Usually you want a "soft" version of this, e.g., via
> the OOM handler (so only drop parts of the cache, not all).

Right. We'll need something softer I guess. By how much, I don't know.

-- 
MST
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
