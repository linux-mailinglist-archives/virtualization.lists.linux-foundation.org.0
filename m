Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D3644A5ED
	for <lists.virtualization@lfdr.de>; Tue,  9 Nov 2021 05:52:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 282D4400D9;
	Tue,  9 Nov 2021 04:52:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lQhFhVuvet4B; Tue,  9 Nov 2021 04:52:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id CEEA3401FB;
	Tue,  9 Nov 2021 04:52:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 42281C0036;
	Tue,  9 Nov 2021 04:52:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1A4C8C000E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Nov 2021 04:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6050401E3
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Nov 2021 04:52:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i_5TBHTykgQ3
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Nov 2021 04:52:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9EA97400D9
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Nov 2021 04:52:24 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id c126so9841370pfb.0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 08 Nov 2021 20:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=JkapuSwOnwxCbVYO9bfegcqw8wgDzralipX1H1BuD5E=;
 b=Oq8Hop7UfqF6odaW6RoWQK/Dre2F5iWQRWQwE0ryorhq4KCyAzFVrKhpsKLelcCOLT
 eLaYcntMkP6D9l28kM3sfnjAoF0i4Dvr9OmjjZOTULC8HzEQysGVQnjrb3i+Q98U2OAk
 l5M4aVtDq7IlqDrbuwHzqPEsEQwrt5EMFmspVurem58kicyZcN4ZnLTNTy7G1Hsil7FD
 Zt60JANYdAcZ6/mS6y4fb+NsObX+3f0QIYGPkDzjNbPIOwh0TVqaIuEkaBIwYR6M5QpF
 cdmJ0JaW8GIpsnOkUlIIm2RItYNV/lYlysK6ElrG0MLDNtWOU603v7S6lGADLyH/FYYR
 kfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JkapuSwOnwxCbVYO9bfegcqw8wgDzralipX1H1BuD5E=;
 b=XttoTb2nscXF6q8MYl7hoOjSFTHqeKYlGUtqsP+ye1xRygg6cUDQq0C4sAkAyoLyTs
 yxc5k8hc8hSxjfmTK33wifWfOxaoL+A2VX146uDqGL3HqZyDg9maoP1RDcI4O1V0DHUD
 D/lGrjXlug0LuTArtm9/iF3TrNzwKItuGZNwpEwvrn1wFDB8f2ZnYnCdVZnJTZnzbAyd
 BOmu0K//F6JU89wT7jFVeJ/b+Tj/cqIb8am3B6NX7Hvy+1ThwKqsbtOYFrCfSjrmRhTV
 N9basymTOcLBplIncY1OGm6bniVhvpN8RiU8s+k/iQrEygv0ifc3E0ZWAD/kGp88EVAl
 9UFA==
X-Gm-Message-State: AOAM533/nWwkffpq3XXGMW72/PA5QQSnnxdXg/EhFHdiN1BRMRyYkbqQ
 Vr6VbvEa0EZxQZP1mbDjCHWvqw==
X-Google-Smtp-Source: ABdhPJzo3mMOKUdZsnUntoCNQmDl0+nv890fatGtqLtt0zBDXxYrbya9x8UXloTwjlz15zmjWW8Z9A==
X-Received: by 2002:a05:6a00:230d:b0:49f:b8ad:ae23 with SMTP id
 h13-20020a056a00230d00b0049fb8adae23mr5043480pfh.80.1636433543998; 
 Mon, 08 Nov 2021 20:52:23 -0800 (PST)
Received: from localhost ([223.226.77.81])
 by smtp.gmail.com with ESMTPSA id na13sm976263pjb.11.2021.11.08.20.52.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 20:52:23 -0800 (PST)
Date: Tue, 9 Nov 2021 10:22:21 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Vincent Whitchurch <vincent.whitchurch@axis.com>
Subject: Re: [PATCH 1/2] i2c: virtio: disable timeout handling
Message-ID: <20211109045221.xd6apt473jannag2@vireshk-i7>
References: <20211020064128.y2bjsbdmpojn7pjo@vireshk-i7>
 <01d9c992-28cc-6644-1e82-929fc46f91b4@intel.com>
 <20211020105554.GB9985@axis.com>
 <20211020110316.4x7tnxonswjuuoiw@vireshk-i7>
 <df7e6127-05fb-6aad-3896-fc810f213a54@intel.com>
 <20211029122450.GB24060@axis.com>
 <8592a48d-0131-86bf-586a-d33e7989e523@intel.com>
 <MWHPR11MB0030C3489F38FF2AAF7C3D0A908C9@MWHPR11MB0030.namprd11.prod.outlook.com>
 <20211103063745.utpphthou4angs4s@vireshk-i7>
 <20211103144241.GA27285@axis.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211103144241.GA27285@axis.com>
User-Agent: NeoMutt/20180716-391-311a52
Cc: Greg KH <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, Wolfram Sang <wsa@kernel.org>,
 kernel <kernel@axis.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "Chen,
 Conghui" <conghui.chen@intel.com>
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

On 03-11-21, 15:42, Vincent Whitchurch wrote:
> The suggested timeout is not meant to take into account the overhead of
> virtualization, but to be used by the virtio device as a timeout for the
> transaction on the I2C bus (presumably by programming this value to the
> physical I2C controller, if one exists).
> 
> Assume that userspace (or an I2C client driver) asks for a timeout of 20
> ms for a particular transfer because it, say, knows that the particular
> connected I2C peripheral either responds within 10 ms to a particular
> register read or never responds, so it doesn't want to waste time
> waiting unnecessarily long for the transfer to complete.
> 
> If the virtio device end does not have any information on what timeout
> is required (as in the current spec), it must assume some high value
> which will never cause I2C transactions to spuriously timeout, say 10
> seconds.  
>
> Even if the virtio driver is fixed to copy and hold all buffers to avoid
> memory corruption and to time out and return to the caller after the
> requested 20 ms, the next I2C transfer can not be issued until 10
> seconds have passed, since the virtio device end will still be waiting
> for the hardcoded 10 second timeout and may not respond to new requests
> until that transfer has timed out.

Okay, so this is more about making sure the device times-out before
the driver or lets say in an expected time-frame. That should be okay
I guess.

-- 
viresh
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
