Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 950291A52EA
	for <lists.virtualization@lfdr.de>; Sat, 11 Apr 2020 18:38:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6B97385C4C;
	Sat, 11 Apr 2020 16:38:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0U3ob4bnRhsf; Sat, 11 Apr 2020 16:38:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F270985BE4;
	Sat, 11 Apr 2020 16:38:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D378AC0177;
	Sat, 11 Apr 2020 16:38:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B1551C0177
 for <virtualization@lists.linux-foundation.org>;
 Sat, 11 Apr 2020 16:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A257986852
 for <virtualization@lists.linux-foundation.org>;
 Sat, 11 Apr 2020 16:38:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uj9wPTw9utOZ
 for <virtualization@lists.linux-foundation.org>;
 Sat, 11 Apr 2020 16:38:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id AB2708684A
 for <virtualization@lists.linux-foundation.org>;
 Sat, 11 Apr 2020 16:38:27 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id z26so4785726ljz.11
 for <virtualization@lists.linux-foundation.org>;
 Sat, 11 Apr 2020 09:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HHjNiAPiJ1Oz2tFcDWgKOCe+L+oTgqAXQPJRZQ/4hzk=;
 b=fURPhmhZDafu3/qkIgLMIEfe4A4py1LqcCqCeBR+aVwJ7drlaVanUhZYjyx5KCUiZx
 KGDD6HlS++yVH8L88Y7vc/HiMTfe8JLWu5zgSXu8r7QLGa8LZ7tfbZa2cOHm/M603dUP
 wu/c+M9wGg8Em1o8TiiYeR2NppvuUZeOBDKjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HHjNiAPiJ1Oz2tFcDWgKOCe+L+oTgqAXQPJRZQ/4hzk=;
 b=O+VKglYJ7UWRjTumjcLWGey40jbx8m99Lqoj9m84gWkTNSEpoohyc7QD74KgLY14tY
 FZJdTh96K5w/gMHvvsoDar80JiSHEEgfZVRefXRNuD1Rb3wG3P4FHI5ZWGl6slLacF8f
 +fipxQPBfclQbbdOKcrhX4+V5uzpJJDftOefYI73yE3GWZs+FuWCM8qeeEm1f3afQMRc
 /LHXWOvKAjnz5VvKkQha+oyNTA1kWFPh27zVhPCO+PPJRJIxYDOsaOkGTPirpjbxezgt
 1nLvmqonQNJYEw6zLnbtTqLAO6xTpoPTrxg6cJni2p9jBlvdCT8rwvTB4ywAcjxOMdwB
 UH6Q==
X-Gm-Message-State: AGi0PubKpGf8W+vohFAm8XTdensNBbBBlNGcenuwWigQ/wjlQapTEOMS
 y99pMNg9pNFll8mhBXyEAejIw54josPQXA==
X-Google-Smtp-Source: APiQypIxzA9wDA3+4FgM2q2xo5M4v5gdLiOHi9zSBpErbegS5PKQtt4EicVdSOEmLFpmrhB9ZX2CPA==
X-Received: by 2002:a2e:7d14:: with SMTP id y20mr6281599ljc.268.1586623103825; 
 Sat, 11 Apr 2020 09:38:23 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com.
 [209.85.208.177])
 by smtp.gmail.com with ESMTPSA id m18sm4086289lfj.10.2020.04.11.09.38.21
 for <virtualization@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Apr 2020 09:38:22 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id r24so4815364ljd.4
 for <virtualization@lists.linux-foundation.org>;
 Sat, 11 Apr 2020 09:38:21 -0700 (PDT)
X-Received: by 2002:a2e:8652:: with SMTP id i18mr6327984ljj.265.1586623101184; 
 Sat, 11 Apr 2020 09:38:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200406171124-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200406171124-mutt-send-email-mst@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 11 Apr 2020 09:38:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg7sMywb2V8gifhpUDE=DWQTvg1wDieKVc0UoOSsOrynw@mail.gmail.com>
Message-ID: <CAHk-=wg7sMywb2V8gifhpUDE=DWQTvg1wDieKVc0UoOSsOrynw@mail.gmail.com>
Subject: Re: [GIT PULL] vhost: fixes, vdpa
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: tiwei.bie@intel.com, KVM list <kvm@vger.kernel.org>,
 Netdev <netdev@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 virtualization@lists.linux-foundation.org, tysand@google.com,
 eperezma@redhat.com, xiao.w.wang@intel.com, Nadav Amit <namit@vmware.com>,
 David Rientjes <rientjes@google.com>, yuri.benditovich@daynix.com,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Michal Hocko <mhocko@kernel.org>, lingshan.zhu@intel.com
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

On Mon, Apr 6, 2020 at 2:11 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> The new vdpa subsystem with two first drivers.

So this one is really annoying to configure.

First it asks for vDPA driver for virtio devices (VIRTIO_VDPA) support.

If you say 'n', it then asks *again* for VDPA drivers (VDPA_MENU).

And then when you say 'n' to *that* it asks you for Vhost driver for
vDPA-based backend (VHOST_VDPA).

This kind of crazy needs to stop.

Doing kernel configuration is not supposed to be like some truly
horrendously boring Colossal Cave Adventure game where you have to
search for a way out of maze of twisty little passages, all alike.

                Linus
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
