Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B794E7280
	for <lists.virtualization@lfdr.de>; Fri, 25 Mar 2022 12:58:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 274BA60A79;
	Fri, 25 Mar 2022 11:58:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I6DVq7ak8dEa; Fri, 25 Mar 2022 11:58:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0FB0060A99;
	Fri, 25 Mar 2022 11:58:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7E866C0073;
	Fri, 25 Mar 2022 11:58:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 95B1BC0012
 for <virtualization@lists.linux-foundation.org>;
 Fri, 25 Mar 2022 11:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 701ED84494
 for <virtualization@lists.linux-foundation.org>;
 Fri, 25 Mar 2022 11:58:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 74SgBVkOO0-U
 for <virtualization@lists.linux-foundation.org>;
 Fri, 25 Mar 2022 11:58:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail3-166.sinamail.sina.com.cn (mail3-166.sinamail.sina.com.cn
 [202.108.3.166])
 by smtp1.osuosl.org (Postfix) with SMTP id 44EFA84488
 for <virtualization@lists.linux-foundation.org>;
 Fri, 25 Mar 2022 11:58:14 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([114.249.57.134])
 by sina.com (172.16.97.23) with ESMTP
 id 623DAE40000190CE; Fri, 25 Mar 2022 19:57:54 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 71142854919576
From: Hillf Danton <hdanton@sina.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 1/2] vdpa: mlx5: prevent cvq work from hogging CPU
Date: Fri, 25 Mar 2022 19:57:58 +0800
Message-Id: <20220325115758.3962-1-hdanton@sina.com>
In-Reply-To: <CACGkMEvie2Zx9OnwOydguCiLMw71vKB1HmqX0uD9LuWPAakRRw@mail.gmail.com>
References: <CACGkMEvF80FuU0uD+RZMOrySQ0K2RZVh7Pmn4UhNtz_Exs3c2w@mail.gmail.com>
 <CACGkMEvLqox3QZxpxeQdrjBnM6zRr_wGfddoN45RUSsZEOe=bQ@mail.gmail.com>
 <20220321123420.3207-1-hdanton@sina.com>
 <CACGkMEt-PRCsBQ+EJVGeWGikJfLk-0M1dRPMqnp9YC5R4HYAjQ@mail.gmail.com>
 <20220324005345.3623-1-hdanton@sina.com>
 <20220324060419.3682-1-hdanton@sina.com>
 <20220324021428-mutt-send-email-mst@kernel.org>
 <20220324120217.3746-1-hdanton@sina.com>
 <DM8PR12MB54004034A8A5DA1D2B6EA8D1AB199@DM8PR12MB5400.namprd12.prod.outlook.com>
 <CACGkMEtVUqJcS1W2p1U9RCjQqQOSREu1J9zjmw37TbPBNqq7tA@mail.gmail.com>
 <20220325024324-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Cc: Eli Cohen <elic@nvidia.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
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

On Fri, 25 Mar 2022 15:53:09 +0800 Jason Wang wrote:
> 
> Ok, Hillf, does this make sense for you? We want the issue to be fixed
> soon, it's near to our product release.

Feel free to go ahead - product release is important.

BR
Hillf
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
