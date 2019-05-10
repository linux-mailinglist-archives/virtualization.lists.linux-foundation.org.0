Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D61B81A3DA
	for <lists.virtualization@lfdr.de>; Fri, 10 May 2019 22:15:45 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1E623EE1;
	Fri, 10 May 2019 20:15:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7CB56EB4
	for <virtualization@lists.linux-foundation.org>;
	Fri, 10 May 2019 20:15:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 28490875
	for <virtualization@lists.linux-foundation.org>;
	Fri, 10 May 2019 20:15:41 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id c3so6714221otr.3
	for <virtualization@lists.linux-foundation.org>;
	Fri, 10 May 2019 13:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=haQb/JJEXbzGwY8djXGgfBZiIn+/x5Yv5AUgQ4m38OM=;
	b=WEeqre45hj7sSv58I/e7A5coRY+GxRJHinyFbk3h7U4aJrBJYpdYkhq9T1r4+5or5d
	jRR3GR4Z+c950AiPGFzXe4QQXlx4J3RcgRXk7RadE4sRSsQK7+mC+RHs2IEhRwKUI7Zy
	/T1NcmREZZ/qpW4sfz6npTMRE2tie3uif+puXikMYRBthExnMytzYTF00hoiHxBr5/P0
	7jNqauenyRbY3EQ6raNfL+QovOy++Rd9rquniNrMmi7pGZFEPwXRnlT7u+kZ42rUMzcD
	v4eAUwbD5Njo6W9aRbjgU1OhGsIT/fgW+T3LVLT6M51FFHqJTii+xqDcL8xDANdQWGtc
	2Dxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=haQb/JJEXbzGwY8djXGgfBZiIn+/x5Yv5AUgQ4m38OM=;
	b=ddTgtBAht9EGqmpwKgzZ78CZFxkENLPYKorC8dpuQ0uNFYihq0nAei+SygDlnsbWOK
	laHKNoIDjDYJb3E8Ku9WBWQ9yLkDT4ekSHcRaoFlSVUlhxh+tG4MD2sdeJAoROSgzujT
	UltJ7cp8ZHJneBuIUzBNT/ZNLxqAF25LkRmzdwNt47LHLheJ1+K+L94IJMRcoGcGc2GO
	XWRgkn4jeMRE3EDGq7cvFVzFKo1BF09FNvwJDIsXwkcqIE0z4KRGZB/CDwJAGMgAACTT
	Cc6/0cNOhZ9STwzlFlGM96ziO4PehFYZkF4sNMUS0PdVsHDcXig+uIkbK7Yo93nw3TdT
	EJSg==
X-Gm-Message-State: APjAAAVhjQUOx9Ab7q47RhYHkBUnw5lQKt1136Mdppn80HcRG2ArDg0H
	Qh234nh+x3FZ0bbZkG1BHMd3w8bdEGcgIFywz98PTg==
X-Google-Smtp-Source: APXvYqzGzV4vCYOWqp7L7v2b9h2jjvTQectDwMiq79aWZo81gT17ipgMl7EwlMGGL3BIVEygxWA2BmYfTI9FLFAVAXk=
X-Received: by 2002:a9d:6f19:: with SMTP id n25mr2918893otq.367.1557519340452; 
	Fri, 10 May 2019 13:15:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190510155202.14737-1-pagupta@redhat.com>
In-Reply-To: <20190510155202.14737-1-pagupta@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 10 May 2019 13:15:29 -0700
Message-ID: <CAPcyv4joEZaePvzc__N9Q3nozoHgQn7hNFPjBVo5BP6cc4rkEA@mail.gmail.com>
Subject: Re: [PATCH v8 0/6] virtio pmem driver
To: Pankaj Gupta <pagupta@redhat.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: cohuck@redhat.com, Jan Kara <jack@suse.cz>, KVM list <kvm@vger.kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, david <david@fromorbit.com>,
	Qemu Developers <qemu-devel@nongnu.org>,
	virtualization@lists.linux-foundation.org,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Ross Zwisler <zwisler@kernel.org>, Andrea Arcangeli <aarcange@redhat.com>,
	Dave Jiang <dave.jiang@intel.com>, jstaron@google.com,
	linux-nvdimm <linux-nvdimm@lists.01.org>,
	Vishal L Verma <vishal.l.verma@intel.com>,
	Matthew Wilcox <willy@infradead.org>,
	Christoph Hellwig <hch@infradead.org>,
	Linux ACPI <linux-acpi@vger.kernel.org>, jmoyer <jmoyer@redhat.com>,
	linux-ext4 <linux-ext4@vger.kernel.org>,
	Len Brown <lenb@kernel.org>, Adam Borowski <kilobyte@angband.pl>,
	Rik van Riel <riel@surriel.com>, yuval shaia <yuval.shaia@oracle.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, lcapitulino@redhat.com,
	Nitesh Narayan Lal <nilal@redhat.com>, Theodore Ts'o <tytso@mit.edu>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	"Darrick J. Wong" <darrick.wong@oracle.com>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-xfs <linux-xfs@vger.kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Igor Mammedov <imammedo@redhat.com>
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

On Fri, May 10, 2019 at 8:52 AM Pankaj Gupta <pagupta@redhat.com> wrote:
>
>  Hi Michael & Dan,
>
>  Please review/ack the patch series from LIBNVDIMM & VIRTIO side.
>  We have ack on ext4, xfs patches(4, 5 & 6) patch 2. Still need
>  your ack on nvdimm patches(1 & 3) & virtio patch 2.

I was planning to merge these via the nvdimm tree, not ack them. Did
you have another maintainer lined up to take these patches?
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
