Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CF321014C
	for <lists.virtualization@lfdr.de>; Wed,  1 Jul 2020 03:09:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 759488836E;
	Wed,  1 Jul 2020 01:09:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZXbfxl9Wu40A; Wed,  1 Jul 2020 01:09:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id AE3F088362;
	Wed,  1 Jul 2020 01:09:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8E8E1C016E;
	Wed,  1 Jul 2020 01:09:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2CDEAC016E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 01:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1560D876FC
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 01:09:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rpl-CtmUe--A
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 01:09:08 +0000 (UTC)
X-Greylist: delayed 00:05:36 by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E2370864AD
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 01:09:08 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id cm21so929073pjb.3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 18:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=i1SOchKZ/ulQnHhpPSyWO9xT/75BMeth9ktg5RGv4Y4=;
 b=SRqgOiDfo+bpResuzcf8kRlzdKislh9gJEKWyIyeIbhJ2hHpcPyq5galX8RPNblatx
 1oIap2OsheBZHwLXbh6XHHP6KGu1TMvSQ/kj03iTncRrd7brzs08FifIDGSOU6DmqUls
 rzUpjtM0HD9UQAqlZhmljy5Si/PiJoBoItMmZegeFGIkC4ZD76aE1J4VHg7rPHheJ+AB
 lBOjpgjJBGd9gvR12hVLSfCcpZOyAbFDP4o56WnzAGLjJ649NqtmaeAnfWvoggoNX2/w
 X2TQ593A/+V+oDAh1jeUJpHXHlK4KGSExxc2jleA5JfSuLwhw6z9QdaBL6VMi+sRhSc5
 NnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i1SOchKZ/ulQnHhpPSyWO9xT/75BMeth9ktg5RGv4Y4=;
 b=GFg3/mj1WGd6Zay3m8tOxYC2v+TwGm3w5+PazGjX9ST2lWVuyMIxfRWR4KVmOC62Lz
 DhzjuJaowlwlsn1TQX4hdCZgLGzv3ilK6RkzibiPSwmG2P+Kav7S4/RZjQ2lJYb/PpyR
 Z/Oi8wveZWa+rRsUbPt+a/JIbvPxUGgfcmfer4lts6Uo1uxbrglQWgUsw5pzCdb173eI
 YLaOfglUVSe6gE7acIN+IAWqVMvn4ZNRfySAjhHuyfr7G8qe1Ysfm25j/JdugC64I34r
 MxW2swidzxd+ZxEAqzXxP/io4+IfiP6B6qrq/80L9W0rV7weESq65PKLAq/dkDOFn7c0
 vFmg==
X-Gm-Message-State: AOAM533VK55djQTWqWJpRnKrbHGvSrJz1m2Wux3VPOPh9rivgE3rBSfT
 X7lPGpxrGAZKt1qbWIUPi55dn6De0QZzMg==
X-Google-Smtp-Source: ABdhPJzXoVRhuyjhMLrMjLWtZrz422qjtMxAxEoKnokFEMriFw4m4fSOrPCyc/pZW0SA+xTbCDCdmw==
X-Received: by 2002:a17:902:6ac4:: with SMTP id
 i4mr18471013plt.252.1593565412020; 
 Tue, 30 Jun 2020 18:03:32 -0700 (PDT)
Received: from ?IPv6:2605:e000:100e:8c61:5066:4556:8aed:6810?
 ([2605:e000:100e:8c61:5066:4556:8aed:6810])
 by smtp.gmail.com with ESMTPSA id 26sm3781308pfp.35.2020.06.30.18.03.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2020 18:03:31 -0700 (PDT)
Subject: Re: [PATCH] virtio-blk: free vblk-vqs in error path of virtblk_probe()
To: Hou Tao <houtao1@huawei.com>, linux-block@vger.kernel.org,
 virtualization@lists.linux-foundation.org
References: <20200615041459.22477-1-houtao1@huawei.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <daba0f31-df05-0d1f-9422-15c6813f62af@kernel.dk>
Date: Tue, 30 Jun 2020 19:03:30 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200615041459.22477-1-houtao1@huawei.com>
Content-Language: en-US
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ming Lei <ming.lei@canonical.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
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

On 6/14/20 10:14 PM, Hou Tao wrote:
> Else there will be memory leak if alloc_disk() fails.

Applied, thanks.

-- 
Jens Axboe

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
