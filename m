Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F6118DBB1
	for <lists.virtualization@lfdr.de>; Sat, 21 Mar 2020 00:20:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A78EE86C7E;
	Fri, 20 Mar 2020 23:19:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8yGvApxGWOuu; Fri, 20 Mar 2020 23:19:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 608F886C8D;
	Fri, 20 Mar 2020 23:19:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 45030C07FF;
	Fri, 20 Mar 2020 23:19:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7538DC07FF
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 23:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6C57F2549D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 23:19:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5qPgPPbA+cPm
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 23:19:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by silver.osuosl.org (Postfix) with ESMTPS id 3E62920463
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 23:19:55 +0000 (UTC)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id D98212D6;
 Fri, 20 Mar 2020 23:19:53 +0000 (UTC)
Date: Fri, 20 Mar 2020 17:19:52 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Wang Wenhu <wenhu.wang@vivo.com>
Subject: Re: [PATCH v3,1/2] doc: zh_CN: index files in filesystems subdirectory
Message-ID: <20200320171952.5a00ed84@lwn.net>
In-Reply-To: <20200316110143.97848-1-wenhu.wang@vivo.com>
References: <20200315155258.91725-1-wenhu.wang@vivo.com>
 <20200316110143.97848-1-wenhu.wang@vivo.com>
Organization: LWN.net
MIME-Version: 1.0
Cc: Miklos Szeredi <miklos@szeredi.hu>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jaskaran Singh <jaskaransingh7654321@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 virtualization@lists.linux-foundation.org, kernel@vivo.com,
 Harry Wei <harryxiyou@gmail.com>, "Tobin C. Harding" <tobin@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, linux-fsdevel@vger.kernel.org,
 Alex Shi <alex.shi@linux.alibaba.com>,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
 Vivek Goyal <vgoyal@redhat.com>
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

On Mon, 16 Mar 2020 04:01:31 -0700
Wang Wenhu <wenhu.wang@vivo.com> wrote:

> Add filesystems subdirectory into the table of Contents for zh_CN,
> all translations residing on it would be indexed conveniently.
> 
> Reviewed-by: Alex Shi <alex.shi@linux.alibaba.com>
> Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Signed-off-by: Wang Wenhu <wenhu.wang@vivo.com>
> ---
> Changelog since v1:
>  - v2: added SPDX header
>  - v3: rm raw latex field in translations/zh_CN/filesystems/index.rst
>         for none compatibility test with Sphinx 1.7.9 or later.
>        Actually only Sphinx v1.6.7 avalible for me currently.
>        Reviewed-by labels added

Both patches applied, thanks.

jon
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
