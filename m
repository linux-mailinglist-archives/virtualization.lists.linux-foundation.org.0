Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id AED2C21D4E9
	for <lists.virtualization@lfdr.de>; Mon, 13 Jul 2020 13:27:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 61D9289677;
	Mon, 13 Jul 2020 11:27:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4GQVGT9dOtxe; Mon, 13 Jul 2020 11:27:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DCD1F89675;
	Mon, 13 Jul 2020 11:27:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A8ED0C0733;
	Mon, 13 Jul 2020 11:27:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EE622C0733
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 11:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2BA0725014
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 11:27:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EUq+YHKwvHtV
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 11:27:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id F34E1250D0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 11:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594639628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NndF9MqDcvO4KNH3w4Ig8XfoceRFDUTb0+wABisiArU=;
 b=AzQaZedYXb50wc+fr8+dIZPUsiObXXshtwDAVFF7w/piG5hLZEMaazX5UEV+fK6zbSpKCC
 HyxS9wb1Ox4ZMHB+3hmPLPD2TBLWNE6fn6EBTTE1I+Zts+O85LeUCyTYZabCX2oa4XgIKP
 P2Ej5qGUJa6xF5KTyMgP1ad1gmcAyps=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91--l7NtClUMaaxXcBk2Y0EoQ-1; Mon, 13 Jul 2020 07:27:07 -0400
X-MC-Unique: -l7NtClUMaaxXcBk2Y0EoQ-1
Received: by mail-wr1-f72.google.com with SMTP id d11so17434126wrw.12
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 04:27:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NndF9MqDcvO4KNH3w4Ig8XfoceRFDUTb0+wABisiArU=;
 b=jkHCSAkPXIuECV+XFk577u1qurc+JWZ5MTY+gj8FnDAVcSGJwm73KxHmzjg0KYR5AS
 VFnYlyLHo7nkKzUdHKhFrWbsrwLwvG8XEobEycz4CnkvoepvVhi745z/abCS1ggDrWOz
 wt2uaL3b+XI4U5F1C470fE9hOQCNDj6wH98YSP73UcmcaXe6PmWkjdFImmM6kIk0Ve6u
 DKMjX3M1ZOSzzoijzVZhUso4Bp23HE2ob14ZIhIy+myrgZG9FpRR/PuCCeKKGmejMIBc
 kkIhttY/BasdHpHJbJyeRVaIuhHNe8RKmm5BQpE7aKIlVHOgHIvbiWeZD6hhUCaIkqBP
 BHTg==
X-Gm-Message-State: AOAM533/7nH3R+hyY2EoEMRhn6Og4e2R9Kgui7+rJfydyEVZ+v/RyaSw
 bgNUTt4Ej9iFPfp8PLMMLBNY83XzDyT7yVAJv/7bbX8Zxn5H23cF7WkvN1FFPc/UndRKTEk0iNG
 kSHF0Wo1NXMkqHXlqCNvc5boiC6PP1UmfYV3mOEYlGw==
X-Received: by 2002:adf:e40e:: with SMTP id g14mr85945102wrm.271.1594639626487; 
 Mon, 13 Jul 2020 04:27:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoQoJFGLmA7IKeh1vfhF4LpR1itbcrQH3486CQtGPbzU10VTecZ0k8Yt5A6ZRHstGlY191xQ==
X-Received: by 2002:adf:e40e:: with SMTP id g14mr85945083wrm.271.1594639626252; 
 Mon, 13 Jul 2020 04:27:06 -0700 (PDT)
Received: from redhat.com (bzq-79-180-10-140.red.bezeqint.net. [79.180.10.140])
 by smtp.gmail.com with ESMTPSA id z132sm23730810wmb.21.2020.07.13.04.27.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 04:27:05 -0700 (PDT)
Date: Mon, 13 Jul 2020 07:27:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH v3 07/19] vhost: Remove redundant use of
 read_barrier_depends() barrier
Message-ID: <20200713072618-mutt-send-email-mst@kernel.org>
References: <20200710165203.31284-1-will@kernel.org>
 <20200710165203.31284-8-will@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200710165203.31284-8-will@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Joel Fernandes <joelaf@google.com>, Mark Rutland <mark.rutland@arm.com>,
 Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 linux-arm-kernel@lists.infradead.org, Sami Tolvanen <samitolvanen@google.com>,
 linux-alpha@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
 Matt Turner <mattst88@gmail.com>, kernel-team@android.com,
 Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Richard Henderson <rth@twiddle.net>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Fri, Jul 10, 2020 at 05:51:51PM +0100, Will Deacon wrote:
> Since commit 76ebbe78f739 ("locking/barriers: Add implicit
> smp_read_barrier_depends() to READ_ONCE()"), there is no need to use
> smp_read_barrier_depends() outside of the Alpha architecture code.
> 
> Unfortunately, there is precisely _one_ user in the vhost code, and
> there isn't an obvious READ_ONCE() access making the barrier
> redundant. However, on closer inspection (thanks, Jason), it appears
> that vring synchronisation between the producer and consumer occurs via
> the 'avail_idx' field, which is followed up by an rmb() in
> vhost_get_vq_desc(), making the read_barrier_depends() redundant on
> Alpha.
> 
> Jason says:
> 
>   | I'm also confused about the barrier here, basically in driver side
>   | we did:
>   |
>   | 1) allocate pages
>   | 2) store pages in indirect->addr
>   | 3) smp_wmb()
>   | 4) increase the avail idx (somehow a tail pointer of vring)
>   |
>   | in vhost we did:
>   |
>   | 1) read avail idx
>   | 2) smp_rmb()
>   | 3) read indirect->addr
>   | 4) read from indirect->addr
>   |
>   | It looks to me even the data dependency barrier is not necessary
>   | since we have rmb() which is sufficient for us to the correct
>   | indirect->addr and driver are not expected to do any writing to
>   | indirect->addr after avail idx is increased
> 
> Remove the redundant barrier invocation.
> 
> Suggested-by: Jason Wang <jasowang@redhat.com>
> Acked-by: Paul E. McKenney <paulmck@kernel.org>
> Signed-off-by: Will Deacon <will@kernel.org>


I agree

Acked-by: Michael S. Tsirkin <mst@redhat.com>

Pls merge with the rest of the patchset.

> ---
>  drivers/vhost/vhost.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> index d7b8df3edffc..74d135ee7e26 100644
> --- a/drivers/vhost/vhost.c
> +++ b/drivers/vhost/vhost.c
> @@ -2092,11 +2092,6 @@ static int get_indirect(struct vhost_virtqueue *vq,
>  		return ret;
>  	}
>  	iov_iter_init(&from, READ, vq->indirect, ret, len);
> -
> -	/* We will use the result as an address to read from, so most
> -	 * architectures only need a compiler barrier here. */
> -	read_barrier_depends();
> -
>  	count = len / sizeof desc;
>  	/* Buffers are chained via a 16 bit next field, so
>  	 * we can have at most 2^16 of these. */
> -- 
> 2.27.0.383.g050319c2ae-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
