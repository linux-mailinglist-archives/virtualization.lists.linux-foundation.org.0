Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3441B3088D9
	for <lists.virtualization@lfdr.de>; Fri, 29 Jan 2021 13:07:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D8F4F86AE6;
	Fri, 29 Jan 2021 12:07:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aULtpJ2w4sIW; Fri, 29 Jan 2021 12:07:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 616CA86AE0;
	Fri, 29 Jan 2021 12:07:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3020DC08A1;
	Fri, 29 Jan 2021 12:07:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E2533C08A1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 Jan 2021 12:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C6E4727256
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 Jan 2021 12:07:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OhTz80GbsxLQ
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 Jan 2021 12:07:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 by silver.osuosl.org (Postfix) with ESMTPS id CD62B233B0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 Jan 2021 12:07:13 +0000 (UTC)
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id 78391A1525;
 Fri, 29 Jan 2021 13:07:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=srmailgate02; bh=JJnrezCSsqQA
 dlwabjWvvEpW6RUR5/hwqs7PuSOmpuA=; b=y2WG1hIlKlEDeRpuWLRd+Q1b7blL
 z+NMMR9liQvnr2S1apPRu5RaA4WUzhRYnjYLTYEdLq15pKJu7dbhjmIxLrerqw2o
 wfRhH5q+cMhEhjRHMUKzdeAptPZEfvgiFlbdqQT3XDfyuvDe0ls/oM2UGGn4+Ykl
 JHRe/4n5Jjkm3vCgA3/EIY9XRXgMM+pjubpThc39Pj297WHMr8Wm+n3+re+Xe/mf
 LomXuz2l0dPoiIb+g3bfwmQIkvdyX+0HAJ6FMBOdpD1udLBfY5TCisBk2LXVz8+s
 UpV/IWZ3jbs3+IA71Vt9YK04i7yA0Y67lzbYRSePYNhfTI+Y2x+1TJvFvg==
From: Vasyl Vavrychuk <vasyl.vavrychuk@opensynergy.com>
To: <vasyl.vavrychuk@opensynergy.com>
Subject: Re: [PATCH RESEND v3] virtio-input: add multi-touch support
Date: Fri, 29 Jan 2021 14:06:54 +0200
Message-ID: <20210129120654.16180-1-vasyl.vavrychuk@opensynergy.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210115002623.8576-1-vasyl.vavrychuk@opensynergy.com>
References: <20210115002623.8576-1-vasyl.vavrychuk@opensynergy.com>
MIME-Version: 1.0
X-ClientProxiedBy: SR-MAIL-01.open-synergy.com (10.26.10.21) To
 SR-MAIL-01.open-synergy.com (10.26.10.21)
Cc: mst@redhat.com, rydberg@bitmath.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, mathias.crombez@faurecia.com,
 linux-input@vger.kernel.org
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

Hi, All,

There has been no reply to this patch.

Is there anything I can do?

Thanks,
Vasyl

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
