Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D8855E36E
	for <lists.virtualization@lfdr.de>; Tue, 28 Jun 2022 15:37:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C81C610CF;
	Tue, 28 Jun 2022 13:37:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C81C610CF
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=SRPS2zIE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DtLDt4gxkxLv; Tue, 28 Jun 2022 13:36:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 20405610CD;
	Tue, 28 Jun 2022 13:36:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20405610CD
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2B464C007E;
	Tue, 28 Jun 2022 13:36:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 297D9C002D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jun 2022 13:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11AE3408DE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jun 2022 13:36:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11AE3408DE
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca
 header.a=rsa-sha256 header.s=google header.b=SRPS2zIE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q4DhRhG3IiNl
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jun 2022 13:36:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92542408DB
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 92542408DB
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jun 2022 13:36:54 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id i17so19855440qvo.13
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jun 2022 06:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gN4ZNyT9GRZ46Vwx3CUzNgwGxKE3ptwelsb3O/2waMc=;
 b=SRPS2zIET11DP06FAnMANUW30rX+F+KLnmvgpItTZuHDiHMYbx191l+udZ0BIKVo+p
 DUqKNFcRnPxEdciA9v/rjMoUuUABeinU5a59o91m7mO0ei+LjGwfeqP1sFK6bST4r2Sc
 +kwNrequilw+r3whlSvEqjUrw7uEou8aBEv26lUqmckZs7QEO1gxqNAIdKmR6ixdoBBW
 VwXL+VitONeiHER4+6czyOuvux/gSa01CsajOGl6xQeKgTZdOU9/PF5ai6yeP3/8Na6A
 VkyCaiWAoLiX3IML+rZ/qAH9obhof6Stg3VEpk4n7D6sOfmWV6A4zI2itZ9nI+NyrBEn
 GAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gN4ZNyT9GRZ46Vwx3CUzNgwGxKE3ptwelsb3O/2waMc=;
 b=Ko6vu4R5Je5h/oUoxRlU6rgnHWVGDrmYKgsSyOvSnfdZ4l5pXyapdZVkV2kn9pR89t
 3iZgUmT3J1ktUqTUu5owZZ7iLNjQBU+7ahl02doSQs7190p4IxvG5QUIq+2ZvuaTr2Lr
 6YGuRs7pkbDO5rKx7QG0RXCmZ5EBNM4OUVrvSF8RX1YSRPpQvacRqoMrAt0DRzBbJCtZ
 4I3M5Unbw4usazl6kz5IEB5SwGQ8bZk/w8SDJrONb9Rp1CzvUVyacsGoM6mKq9e1f+nK
 q7MEue3U2FlKREhtSgFozA3VoEx0czEHpTrrqkChZpthORLSo5Z7/V4f+sqFD4It51DS
 Qirw==
X-Gm-Message-State: AJIora8Q++dnviOLtqnEr3zFTLA8/2c3CaiDI+zHqF8ejJdRslAEx8dO
 KOgVKYV9hbAs49AYAXBVFGGtPg==
X-Google-Smtp-Source: AGRyM1uooXTVlKXYemR9EvbrrQp4i2XA4BpQT09bjvN7I6xIwm3cKCnpXCNHNGqwd+HxVz52pv3Omw==
X-Received: by 2002:ac8:5b0d:0:b0:31b:f519:4107 with SMTP id
 m13-20020ac85b0d000000b0031bf5194107mr1237416qtw.331.1656423413317; 
 Tue, 28 Jun 2022 06:36:53 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129]) by smtp.gmail.com with ESMTPSA id
 s10-20020a05620a29ca00b006a79479657fsm708363qkp.108.2022.06.28.06.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 06:36:52 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1o6BOd-002vAA-VA; Tue, 28 Jun 2022 10:36:51 -0300
Date: Tue, 28 Jun 2022 10:36:51 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH][next] treewide: uapi: Replace zero-length arrays with
 flexible-array members
Message-ID: <20220628133651.GO23621@ziepe.ca>
References: <20220627180432.GA136081@embeddedor>
 <6bc1e94c-ce1d-a074-7d0c-8dbe6ce22637@iogearbox.net>
 <20220628004052.GM23621@ziepe.ca>
 <20220628005825.GA161566@embeddedor>
 <20220628022129.GA8452@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220628022129.GA8452@embeddedor>
Cc: nvdimm@lists.linux.dev, alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 dm-devel@redhat.com, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net,
 linux-stm32@st-md-mailman.stormreply.com, linux-s390@vger.kernel.org,
 Daniel Borkmann <daniel@iogearbox.net>, linux-rdma@vger.kernel.org,
 x86@kernel.org, kasan-dev@googlegroups.com, lvs-devel@vger.kernel.org,
 coreteam@netfilter.org, v9fs-developer@lists.sourceforge.net,
 Kees Cook <keescook@chromium.org>, intel-gfx@lists.freedesktop.org,
 linux-can@vger.kernel.org, linux-raid@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, virtualization@lists.linux-foundation.org,
 io-uring@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-scsi@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-sctp@vger.kernel.org,
 netfilter-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 bpf@vger.kernel.org, linux-btrfs@vger.kernel.org
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

On Tue, Jun 28, 2022 at 04:21:29AM +0200, Gustavo A. R. Silva wrote:

> > > Though maybe we could just switch off -Wgnu-variable-sized-type-not-at-end  during configuration ?

> We need to think in a different strategy.

I think we will need to switch off the warning in userspace - this is
doable for rdma-core.

On the other hand, if the goal is to enable the array size check
compiler warning I would suggest focusing only on those structs that
actually hit that warning in the kernel. IIRC infiniband doesn't
trigger it because it just pointer casts the flex array to some other
struct.

It isn't actually an array it is a placeholder for a trailing
structure, so it is never indexed.

This is also why we hit the warning because the convient way for
userspace to compose the message is to squash the header and trailer
structs together in a super struct on the stack, then invoke the
ioctl.

Jason 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
