Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 127B8374C94
	for <lists.virtualization@lfdr.de>; Thu,  6 May 2021 03:03:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2831E40239;
	Thu,  6 May 2021 01:03:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pe3na7k09GqK; Thu,  6 May 2021 01:03:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1F1540261;
	Thu,  6 May 2021 01:03:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 42A67C0001;
	Thu,  6 May 2021 01:03:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CC340C0001
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 May 2021 01:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B45D983BD3
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 May 2021 01:03:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tlLgg8Oi-N4v
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 May 2021 01:03:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1565583BD2
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 May 2021 01:03:19 +0000 (UTC)
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7911A610EA;
 Thu,  6 May 2021 01:03:18 +0000 (UTC)
Date: Wed, 5 May 2021 21:03:16 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC][PATCH] vhost/vsock: Add vsock_list file to map cid with
 vhost tasks
Message-ID: <20210505210316.11e1bbcd@oasis.local.home>
In-Reply-To: <20210505163855.32dad8e7@gandalf.local.home>
References: <20210505163855.32dad8e7@gandalf.local.home>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/7JbDmOvvGcBoZTDb=tjglhB"
Cc: Joel Fernandes <joelaf@google.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Linux Trace Devel <linux-trace-devel@vger.kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
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
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--MP_/7JbDmOvvGcBoZTDb=tjglhB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

For kicks, I wrote this program that uses libtracefs to search all CIDS
(1-255), and find the kvm guests that are attached to them.

It traces the sched_wakeup and kvm_exit, looking for:

 this_task -> wakeup -> wakeup -> kvm_exit

when doing a connect to a cid.

When it finds the pid that did a kvm_exit, it knows that's the PID that
is woken by the vhost worker task. It's a little slow, and I would
really like a better way to do this, but it's at least an option that
is available now.

-- Steve

--MP_/7JbDmOvvGcBoZTDb=tjglhB
Content-Type: text/x-c++src
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=vsock-list.c

#define _GNU_SOURCE
#include <asm/types.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <linux/vm_sockets.h>

#include <tracefs.h>

#define MAX_CID		256

static int this_pid;

static int open_vsock(unsigned int cid, unsigned int port)
{
	struct sockaddr_vm addr = {
		.svm_family = AF_VSOCK,
		.svm_cid = cid,
		.svm_port = port,
	};
	int sd;

	sd = socket(AF_VSOCK, SOCK_STREAM, 0);
	if (sd < 0)
		return -1;

	if (connect(sd, (struct sockaddr *)&addr, sizeof(addr)))
		return -1;

	return sd;
}

struct pids {
	struct pids		*next;
	int			pid;
};

struct trace_info {
	struct tracefs_instance		*instance;
	struct tep_handle		*tep;
	struct tep_event		*wake_up;
	struct tep_event		*kvm_exit;
	struct tep_format_field		*common_pid;
	struct tep_format_field		*wake_pid;
	struct pids			*pids;
	int				cid;
	int				pid;
};

static void tear_down_trace(struct trace_info *info)
{
	tracefs_instance_file_write(info->instance, "events/enable", "0");
	tracefs_instance_destroy(info->instance);
	tracefs_instance_free(info->instance);
	tep_free(info->tep);
}

static int setup_trace(struct trace_info *info)
{
	const char *systems[] = { "sched", "kvm", NULL};
	char *name;
	int ret;

	info->pids = NULL;

	ret = asprintf(&name, "vsock_find-%d\n", getpid());
	if (ret < 0)
		return ret;

	info->instance = tracefs_instance_create(name);
	free(name);
	if (!info->instance)
		return -1;

	tracefs_trace_off(info->instance);
	info->tep = tracefs_local_events_system(NULL, systems);
	if (!info->tep)
		goto fail;

	info->wake_up = tep_find_event_by_name(info->tep, "sched", "sched_waking");
	if (!info->wake_up) {
		fprintf(stderr, "Failed to find sched_waking\n");
		goto fail;
	}

	info->kvm_exit = tep_find_event_by_name(info->tep, "kvm", "kvm_exit");
	if (!info->kvm_exit) {
		fprintf(stderr, "Failed to find kvm_exit\n");
		goto fail;
	}

	info->wake_pid = tep_find_any_field(info->wake_up, "pid");
	if (!info->wake_pid) {
		fprintf(stderr, "Failed to find wake up pid\n");
		goto fail;
	}

	info->common_pid = tep_find_common_field(info->wake_up,
						 "common_pid");
	if (!info->common_pid) {
		fprintf(stderr, "Failed to find common pid\n");
		goto fail;
	}

	ret = tracefs_instance_file_write(info->instance, "events/sched/sched_waking/enable", "1");
	if (ret < 0) {
		fprintf(stderr, "Failed to enable sched_waking\n");
		goto fail;
	}

	ret = tracefs_instance_file_write(info->instance, "events/kvm/kvm_exit/enable", "1");
	if (ret < 0) {
		fprintf(stderr, "Failed to enable kvm_exit\n");
		goto fail;
	}

	return 0;
fail:
	tear_down_trace(info);
	return -1;
}


static void free_pids(struct pids *pids)
{
	struct pids *next;

	while (pids) {
		next = pids;
		pids = pids->next;
		free(next);
	}
}

static void add_pid(struct pids **pids, int pid)
{
	struct pids *new_pid;

	new_pid = malloc(sizeof(*new_pid));
	if (!new_pid)
		return;

	new_pid->pid = pid;
	new_pid->next = *pids;
	*pids = new_pid;
}

static bool match_pid(struct pids *pids, int pid)
{
	while (pids) {
		if (pids->pid == pid)
			return true;
		pids = pids->next;
	}
	return false;
}

static int callback(struct tep_event *event, struct tep_record *record,
		    int cpu, void *data)
{
	struct trace_info *info = data;
	struct tep_handle *tep = info->tep;
	unsigned long long val;
	int type;
	int pid;
	int ret;

	ret = tep_read_number_field(info->common_pid, record->data, &val);
	if (ret < 0)
		return 0;

	pid = val;

	if (!match_pid(info->pids, pid))
		return 0;

	type = tep_data_type(tep, record);
	if (type == info->kvm_exit->id) {
		info->pid = pid;
		return -1;
	}

	if (type != info->wake_up->id)
		return 0;

	ret = tep_read_number_field(info->wake_pid, record->data, &val);
	if (ret < 0)
		return 0;

	add_pid(&info->pids, (int)val);
	return 0;
}

static void print_cid_pid(int cid, int pid)
{
	FILE *fp;
	char *path;
	char *buf = NULL;
	char *save;
	size_t l = 0;
	int tgid = -1;

	if (asprintf(&path, "/proc/%d/status", pid) < 0)
		return;

	fp = fopen(path, "r");
	free(path);
	if (!fp)
		return;

	while (getline(&buf, &l, fp) > 0) {
		char *tok;

		if (strncmp(buf, "Tgid:", 5) != 0)
			continue;
		tok = strtok_r(buf, ":", &save);
		if (!tok)
			continue;
		tok = strtok_r(NULL, ":", &save);
		if (!tok)
			continue;
		while (isspace(*tok))
			tok++;
		tgid = strtol(tok, NULL, 0);
		break;
	}
	free(buf);

	if (tgid >= 0)
		printf("%d\t%d\n", cid, tgid);
}

static void find_cid(struct trace_info *info, int cid)
{
	int fd;

	add_pid(&info->pids, this_pid);

	tracefs_instance_file_clear(info->instance, "trace");
	tracefs_trace_on(info->instance);
	fd = open_vsock(cid, -1);
	tracefs_trace_off(info->instance);
	if (fd >= 0)
		close(fd);
	info->cid = cid;
	info->pid = -1;
	tracefs_iterate_raw_events(info->tep, info->instance,
				   NULL, 0, callback, info);
	if (info->pid >= 0)
		print_cid_pid(cid, info->pid);
	tracefs_trace_off(info->instance);
	free_pids(info->pids);
	info->pids = NULL;
}

static int find_cids(void)
{
	struct trace_info info ;
	int cid;

	if (setup_trace(&info) < 0)
		return -1;

	for (cid = 0; cid < MAX_CID; cid++)
		find_cid(&info, cid);

	tear_down_trace(&info);
	return 0;
}

int main(int argc, char *argv[])
{
	this_pid = getpid();
	find_cids();
	exit(0);
}

--MP_/7JbDmOvvGcBoZTDb=tjglhB
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--MP_/7JbDmOvvGcBoZTDb=tjglhB--
